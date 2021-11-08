import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_creed/ui/views/auth_views/login_page.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/widgets/custom_text_field.dart';
import 'package:service_creed/viewmodels/Auth/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool _keepSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      onModelReady: (model) => model.onModelReady(),
      onModelDestroy: (model) => model.onModelDestroy(),
      builder: (context, model, child) => Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset('assets/images/top-right-loginPage.png'),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/bottom-left-loginPage.png',
                ),
              ),
              _buildRegisterForm(model),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(RegisterViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Form(
        key: _formkey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 40),
              _buildNameTextField(model),
              SizedBox(height: 10),
              _buildAddressTextField(model),
              SizedBox(height: 10),
              _buildMobileNoTextField(model),
              SizedBox(height: 10),
              _buildUserNameTextField(model),
              SizedBox(height: 10),
              _buildEmailTextField(model),
              SizedBox(height: 10),
              _buildPasswordTextField(model),
              SizedBox(height: 10),
              _buildConfirmPasswordTextField(model),
              SizedBox(height: 5),
              _buildLogInButton(model),
              SizedBox(height: 5),
              _buildRegisterButton(model, _keepSignedIn),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameTextField(RegisterViewModel model) {
    return CustomTextField(
      model.nameController,
      'Name',
      'Enter your name',
      Icons.person,
      validator: model.nameValidator,
    );
  }

  Widget _buildUserNameTextField(RegisterViewModel model) {
    return CustomTextField(
      model.userNameController,
      'User Name',
      'Enter Unique User Name',
      Icons.account_circle,
      validator: model.nameValidator,
    );
  }

  Widget _buildAddressTextField(RegisterViewModel model) {
    return CustomTextField(
      model.addressController,
      'Address',
      'Enter Your Address',
      Icons.location_on,
      validator: model.nameValidator,
    );
  }

  Widget _buildMobileNoTextField(RegisterViewModel model) {
    return CustomTextField(
      model.mobileNoController,
      'Mobile no.',
      'Enter your mobile no.',
      Icons.phone,
      validator: model.mobileValidator,
      keyBoardType: TextInputType.number,
    );
  }

  Widget _buildEmailTextField(RegisterViewModel model) {
    return CustomTextField(
      model.emailController,
      'Email',
      'Enter your email',
      Icons.email,
      validator: model.emailValidator,
    );
  }

  Widget _buildPasswordTextField(RegisterViewModel model) {
    return CustomTextField(
      model.passwordController,
      'Password',
      'Enter your password',
      Icons.lock,
      isHidden: _isHidden,
      validator: model.passwordValidator,
      suffix: IconButton(
        icon: _isHidden ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        onPressed: () {
          setState(() {
            _isHidden = !_isHidden;
          });
        },
      ),
    );
  }

  Widget _buildConfirmPasswordTextField(RegisterViewModel model) {
    return CustomTextField(
      model.confirmPasswordController,
      'Confirm Password',
      'Again Enter your password',
      Icons.lock,
      isHidden: true,
      validator: model.confirmPasswordValidator,
    );
  }

  Widget _buildLogInButton(RegisterViewModel model) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginView())),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          'Already have an account?',
        ),
      ),
    );
  }

  Widget _buildRegisterButton(RegisterViewModel model, keepSignedIn) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              //textStyle: AppTheme.button,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () => _formkey.currentState.validate()
                ? model.register(keepSignedIn)
                : null,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Sign Up'),
            ),
          ),
        ),
      ],
    );
  }
}
