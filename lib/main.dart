import 'package:service_creed/ui/views/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
