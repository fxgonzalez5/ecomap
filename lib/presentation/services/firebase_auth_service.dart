import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');
  
  Stream<User?> authStatus() {
    return _auth.authStateChanges();
  }

  Future<String?> login(String email, String password) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<CurrentUser?> getUserByEmail(String email) async{
    try {
      final data = await _users.where('email',isEqualTo: email).get();
      final item = data.docs.firstOrNull;
      if(item == null) return null;
      final map = item.data() as Map<String, dynamic>;
      return CurrentUser(name: map['name'], email: email, role: map['role'], project:map['project']); 
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> recoveryPassword(String email)async{
    _auth.sendPasswordResetEmail(email: email);
  }
  
  Future<CurrentUser?> getCurrentUser()async{
    if(_auth.currentUser != null){
      return await getUserByEmail(_auth.currentUser!.email!);
    }
    return null;
  }
}