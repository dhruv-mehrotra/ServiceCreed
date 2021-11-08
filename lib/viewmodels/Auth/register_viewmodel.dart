import 'package:flutter/material.dart';
import 'package:service_creed/validators.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class RegisterViewModel extends BaseViewModel {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;
  TextEditingController _userNameController;
  TextEditingController _addressController;
  TextEditingController _mobileNoController;

  TextEditingController get nameController => _nameController;

  set nameController(nameController) {
    _nameController = nameController;
  }

  TextEditingController get userNameController => _userNameController;

  set userNameController(userNameController) {
    _userNameController = userNameController;
  }

  TextEditingController get addressController => _addressController;

  set addressController(addressController) {
    _addressController = addressController;
  }

  TextEditingController get mobileNoController => _mobileNoController;

  set mobileNoController(mobileNoController) {
    _mobileNoController = mobileNoController;
  }

  TextEditingController get emailController => _emailController;

  set emailController(emailController) {
    _emailController = emailController;
  }

  TextEditingController get passwordController => _passwordController;

  set passwordController(passwordController) {
    _passwordController = passwordController;
  }

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  set confirmPasswordController(confirmPasswordController) {
    _confirmPasswordController = confirmPasswordController;
  }

  void onModelReady() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _userNameController = TextEditingController();
    _addressController = TextEditingController();
    _mobileNoController = TextEditingController();
  }

  void onModelDestroy() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _userNameController.dispose();
    _addressController.dispose();
    _mobileNoController.dispose();
  }

  String Function(String name) get nameValidator => Validator.nameValidator;

  String Function(String email) get emailValidator => Validator.emailValidator;

  String Function(String password) get passwordValidator =>
      Validator.passwordValidator;

  String Function(String mobile) get mobileValidator =>
      Validator.mobileNoValidator;

  String Function(String confirmPassword) get confirmPasswordValidator =>
      (confirmPassword) {
        print(passwordController.text);
        return Validator.confirmPasswordValidator(
            confirmPassword, passwordController);
      };

  void register(keepSignedIn) async {
    // register logic
  }
}
