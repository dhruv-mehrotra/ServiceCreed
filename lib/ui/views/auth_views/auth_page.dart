import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/auth_views/login_page.dart';
import 'package:service_creed/ui/views/auth_views/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: SingleChildScrollView(
          child: IndexedStack(
        index: _currentIndex,
        children: [LoginPage(), SignUpPage()],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: 'Register')
        ],
      ),
    );
  }
}
