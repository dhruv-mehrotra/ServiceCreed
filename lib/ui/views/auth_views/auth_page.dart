import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/auth_views/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Padding(
            padding: const EdgeInsets.all(64.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          _buildList(context),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
              child: Text(
            'Are u a',
            style: TextStyle(fontSize: 20),
          )),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: MaterialButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginView())),
              child: Text('Service Provider'),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: MaterialButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginView())),
              child: Text('Customer'),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
