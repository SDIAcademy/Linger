import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class FireBaseApi {
  // final store = Singelton.store;
  final String facebook =
      "https://linger-b6669.firebaseapp.com/__/auth/handler";
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseUser firebaseUser;

  FireBaseApi([this.firebaseUser]);

  static Future<FireBaseApi> signInWithGoogle(
      {dynamic viewModel, bool slient}) async {
    GoogleSignInAccount googleUser;
    if (slient) {
      try {
        googleUser = await _googleSignIn.isSignedIn() ? await _googleSignIn.signInSilently() : null;
      } catch (e) {
        return null;
      }
    } else
      googleUser = await _googleSignIn.signIn();

    if (viewModel != null) viewModel(pending: true);

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final FirebaseUser user = await _auth.signInWithGoogle(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      try {
        assert(user.email != null);
        assert(user.displayName != null);

        // assert(await user.getIdToken() != null);

        final FirebaseUser currentUser = await _auth.currentUser();
        assert(user.uid == currentUser.uid);
      } catch (e) {
        if (viewModel != null) viewModel(pending: false);
      }
      return FireBaseApi(user);
    }
    if (viewModel != null) viewModel(pending: false);
    return null;
  }

  static Future<Null> loginUser({method, viewModel, slient}) async {
    var api;
    switch (method) {
      case "google":
        api = await FireBaseApi.signInWithGoogle(
            viewModel: viewModel, slient: slient ?? false);
        break;
      case "facebook":
        break;
    }
    if (api != null) {
      var _user = await FirebaseAuth.instance.currentUser();
      if (viewModel != null) viewModel(user: _user);
    }
  }
}
