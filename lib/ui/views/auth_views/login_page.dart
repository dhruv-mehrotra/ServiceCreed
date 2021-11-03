import 'package:flutter/material.dart';
import 'package:service_creed/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  String _email, _pwd;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new SizedBox(
              width: 100.0,
              height: 100.0,
              // TODO(Saumya): add child: new Image.asset("", height: 90.00, width: 90.00),
            ),
            TextFormField(
              onChanged: (value) {
                _email = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                } else
                  return null;
              },

              style: TextStyle(color: Colors.teal),
              // controller: emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Your Email...",
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
                labelText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                _pwd = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                } else
                  return null;
              },

              style: TextStyle(),
              // controller: passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Your Password...",
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
                border: new OutlineInputBorder(borderSide: new BorderSide()),
                labelText: "Password",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result = await _auth.signInUsingEmail(_email, _pwd);
                  if (result == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Could not log in with the given credentials')));
                  }
                }
              },
              child: Text("Log in"),
            ),
          ]),
    );
  }
}
