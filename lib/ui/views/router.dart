import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/primary_page.dart';

class ServiceCreedRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PrimaryPage());
      case 'login':
        return MaterialPageRoute(builder: (_) => Container());
      // case 'nearby_search':
      //   return MaterialPageRoute(builder: (_) => SearchWidget());
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
