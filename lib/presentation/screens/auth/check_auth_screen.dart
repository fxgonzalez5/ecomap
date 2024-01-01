import 'package:ecomap/presentation/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecomap/presentation/screens/screens.dart';


class CheckAuthScreen extends StatelessWidget {
  static const String name = 'check_auth_screen';

  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = FirebaseAuthService();

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: firebaseAuthService.authStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          
          if (snapshot.connectionState == ConnectionState.active){
            if (snapshot.hasData) return const HomeScreen();
          }
          
          return const LoginScreen();
        }, 
      )
   );
  }
}