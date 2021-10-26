import 'package:service_creed/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  String _email, _pwd, _channeli_pwd, _username;

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
              // TODO(Saumya): insert child: new Image.asset("", height: 90.00, width: 90.00),
            ),
            TextFormField(
              onChanged: (value) {
                _email = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field cannot be empty';
                } else
                  return null;
              },

              style: TextStyle(color: Colors.teal),
              // TODO(Saumya): Insert controller: emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Your Email",
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
                  return 'This field cannot be empty';
                } else
                  return null;
              },

              style: TextStyle(),
              // TODO(Saumya): Insert controller: passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Your Password",
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
            TextFormField(
              onChanged: (value) {
                _username = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field cannot be empty';
                } else
                  return null;
              },

              style: TextStyle(color: Colors.teal),
              // TODO(Saumya): Insert controller: emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Your Channel-i username",
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
                labelText: "Channel-i Username",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                _channeli_pwd = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field cannot be empty';
                } else
                  return null;
              },

              style: TextStyle(color: Colors.teal),
              // TODO(Saumya): Insert controller: emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Your Channel-i password",
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
                labelText: "Channel-i Password",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result = await _auth.registerUsingEmail(
                      _email, _pwd, _username, _channeli_pwd);
                  if (result == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Could not log in with the given credentials')));
                  }
                }
              },
              child: Text("Sign Up"),
            ),
          ]),
    );
  }
}
