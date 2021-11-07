import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/auth_views/auth_page.dart';
import 'package:service_creed/ui/views/auth_views/login_page.dart';
import 'package:service_creed/ui/views/primary_page.dart';

class ServiceCreedRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PrimaryPage());
      case 'AuthPage':
        return MaterialPageRoute(builder: (_) => AuthPage());

      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'post':
        return MaterialPageRoute(builder: (_) => null);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Error: no route ${settings.name}'),
                  ),
                ));
    }
  }
}
