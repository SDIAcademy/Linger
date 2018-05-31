import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
// import 'package:redux/redux.dart';
import 'package:linger/presenters/redux.dart';


class FireBaseApi {
  // final store = Singelton.store;
  final String facebook =
      "https://linger-b6669.firebaseapp.com/__/auth/handler";
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseUser firebaseUser;

  FireBaseApi(FirebaseUser user) {
    this.firebaseUser = user;
  }

  static Future<FireBaseApi> signInWithGoogle(viewModel) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    viewModel(pending: true);
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
    assert(user.email != null);
    assert(user.displayName != null);

    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    } catch(e) {
      viewModel(pending: false);
    }
    return FireBaseApi(user);
  }
}
