import 'package:flutter/widgets.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
);

class LoginService {
  int _expireInSeconds = 3600;

  Future<void> login(BuildContext context) async {
    cache.write('isLoggedIn', 'true', _expireInSeconds);
    await Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (route) => false);
  }

  Future user() async {
    return cache.load('user', '{"user": "test", "firstname": "test", "lastname": "test"}');
  }

  Future<void> logout(BuildContext context) async {
    cache.destroy('isLoggedIn');
    cache.destroy('token');
    cache.destroy('user');
    await googleSignIn.signOut();
    await Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (route) => false);
  }

  Future isLogin() async {
    return cache.load('isLoggedIn', 'false');
  }

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = (await googleSignIn.signIn())!;
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
    await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
    var userMap = {"name": user.displayName, "email": user.email};
    cache.write('isLoggedIn', 'true', _expireInSeconds);
    cache.write('user', userMap, _expireInSeconds);
    return '$user';
  }

}
