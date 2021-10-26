import 'package:service_creed/models/firebase_user_model.dart';
import 'package:service_creed/ui/views/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'models/firebase_user_model.dart';
import 'services/auth_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<FirebaseUser>(context);
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
            initialData: null, value: AuthService().user),
        //ChangeNotifierProvider(create: (context) => PostsProvider()),
      ],
      child: ScreenUtilInit(
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Service Creed',
          onGenerateRoute: ServiceCreedRouter.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
        ),
        designSize: const Size(360, 811),
      ),
    );
  }
}
