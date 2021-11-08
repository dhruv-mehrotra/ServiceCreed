import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_creed/ui/views/router.dart';

import 'locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Service Creed',
        onGenerateRoute: ServiceCreedRouter.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'AuthPage',
      ),
      designSize: const Size(360, 811),
    );
  }
}
