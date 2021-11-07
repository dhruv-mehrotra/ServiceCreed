import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/firebase_user_model.dart';
import 'ui/views/auth_views/auth_page.dart';
import 'ui/views/primary_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    return user == null ? AuthPage() : PrimaryPage();
  }
}
