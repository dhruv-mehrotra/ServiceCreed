import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:service_creed/validators.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController forgotPasswordEmailController = TextEditingController();

  void onModelReady() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void onModelDestroy() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get forgotPasswordDialogController =>
      forgotPasswordEmailController;

  void login(bool keepSignedIn) async {
    debugPrint('Email : ${_emailController.text}');
    debugPrint('Password : ${_passwordController.text}');
    debugPrint('keepSignedIn : $keepSignedIn');
    // login logic
  }

  String Function(String password) get passwordValidator =>
      Validator.passwordValidator;

  String Function(String email) get emailValidator => Validator.emailValidator;
}
