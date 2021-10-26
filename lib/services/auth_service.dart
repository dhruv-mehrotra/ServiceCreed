import 'package:service_creed/models/firebase_user_model.dart';
import 'package:service_creed/services/api/channeli_api.dart';
import 'package:service_creed/services/api/firebase_api.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _firebaseUserFromUser(User user) {
    return user == null ? null : FirebaseUser(uid: user.uid);
  }

  // TODO(Saumya): null shouldn't be returned here
  // TODO(Saumya): define return type (ex. Future) too here

  Stream<FirebaseUser> get user {
    return _auth.authStateChanges().map(_firebaseUserFromUser);
  }

  Future signInUsingEmail(String email, String password) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      AccessPair pair;
      await FirebaseApi(uid: cred.user.uid).pair.first.then((value) {
        //is this the best way to do this???
        pair = value;
        return value;
      });
      pair = await obtainPair(pair.refresh);
      FirebaseApi(uid: cred.user.uid).refreshPair(pair);
      return _firebaseUserFromUser(cred.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerUsingEmail(String email, String password, String username,
      String channelipwd) async {
    try {
      AccessPair pair = await obtainNewPair(username, channelipwd);
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //all creds are valid now, create user with this
      FirebaseApi(uid: cred.user.uid).postPair(pair);
      return _firebaseUserFromUser(cred.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
