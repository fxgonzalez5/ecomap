import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/providers/auth_provider.dart';
import 'package:ecomap/presentation/providers/providers.dart' as provider;
import 'package:ecomap/presentation/providers/restauracion_forestal.dart';
import 'package:ecomap/presentation/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:provider/provider.dart';


class CheckAuthScreen extends StatefulWidget {
  static const String name = 'check_auth_screen';
  const CheckAuthScreen({ Key? key }) : super(key: key);

  @override
  _CheckAuthScreenState createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {

  @override
  void initState(){
    super.initState();
    Provider.of<provider.AuthProvider>(context, listen: false).getCurrentUser();
    Provider.of<provider.GeneralProvider>(context, listen: false).getAllJsonProvincias();
    Provider.of<provider.GeneralProvider>(context, listen: false).getAllJsonInstitucionesBancarias();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = FirebaseAuthService();

    return Scaffold(
      body: FutureBuilder(
        future: context.read<AuthProvider>().getCurrentUser(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Manejar error si ocurre
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            if(context.read<AuthProvider>().currentUser == null){
              return LoginScreen();
            }else{
              return HomeScreen();
            }            
          }
        },
      ),
   );
  }/*
  StreamBuilder<User?>(
        stream: firebaseAuthService.authStatus(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          
          if (snapshot.connectionState == ConnectionState.active){
            if (snapshot.hasData) {
              return const HomeScreen();
            }
          }
          
          return const LoginScreen();
        }, 
      )*/
}