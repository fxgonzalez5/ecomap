import 'package:ecomap/config/helpers/helpers.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/screens/auth/verification_screen.dart';
import 'package:ecomap/presentation/screens/home/home_screen.dart';
import 'package:ecomap/presentation/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool _isLoading = false;
  CurrentUser? _currentUser;

  final _firebaseAuthService = FirebaseAuthService();

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  CurrentUser? get currentUser => _currentUser;
  set currentUser(CurrentUser? user){
    _currentUser = user;
    notifyListeners();
  }

  login(BuildContext context)async{
    _isLoading = true;

    final errorMessage = await _firebaseAuthService.login(email.trim(), password.trim());    
    switch (errorMessage) {
      case 'success':
        final user = await _firebaseAuthService.getUserByEmail(email.trim());
        currentUser = user;
        Future.microtask(() => context.pushNamed(HomeScreen.name));
        isLoading = false;
        break;
      case null:
        isLoading = false;
        Future.microtask(() => showSnackBar(context, 'Lo sentimos, no se pudo iniciar sesión'));
        break;
      case 'user-not-found':
        isLoading = false;
        Future.microtask(() => showSnackBar(context, 'No se ha encontrado una cuenta con ese correo electrónico'));
        break;
      case 'wrong-password':
        isLoading = false;
        Future.microtask(() => showSnackBar(context, 'Correo o contraseña incorrecto'));
        break;
      default:
        isLoading = false;
        Future.microtask(() => showSnackBar(context, 'Correo o contraseña inválido'));
        break;
    }
  }

  recoveryPassword(BuildContext context) async{
    isLoading = true;
    await _firebaseAuthService.recoveryPassword(email.trim());
    isLoading = false;
    Future.microtask(() => context.pushReplacementNamed(VerificationScreen.name));
  }

  Future<void> getCurrentUser() async{
    currentUser = await _firebaseAuthService.getCurrentUser();
    print(currentUser?.email);
    print(currentUser?.role);
    print(currentUser?.project);
  }
}