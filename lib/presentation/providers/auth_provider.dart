import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}