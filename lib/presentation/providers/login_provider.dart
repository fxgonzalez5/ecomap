import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _isVisible = false;
  bool _isLoading = false;

  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}