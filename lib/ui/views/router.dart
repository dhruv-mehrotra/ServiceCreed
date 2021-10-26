import 'package:service_creed/ui/views/auth_views/auth_page.dart';
import 'package:service_creed/ui/views/primary_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceCreedRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PrimaryPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => AuthPage());
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
