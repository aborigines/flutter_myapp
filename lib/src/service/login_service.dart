import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class LoginService with ChangeNotifier {

  Stream<User?> get onAuthStateChanged => _firebaseAuth.authStateChanges();

  Future<void> login(BuildContext context) async {
    await Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }

  Future<void> logout() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut()
    ]);
  }

  Future isLogin() async {
    return _googleSignIn.isSignedIn();
  }

  Future<bool> signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleSignInAccount = (await _googleSignIn.signIn())!;
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);
    return authResult.user!.email != null ? true : false;
  }
}
