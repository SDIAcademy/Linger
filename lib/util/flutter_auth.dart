import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:async';

class FireBaseApi {
  final String facebook =
      "https://linger-b6669.firebaseapp.com/__/auth/handler";
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();
  static FacebookLogin _facebookLogin = FacebookLogin();

  FirebaseUser firebaseUser;

  FireBaseApi(FirebaseUser user) {
    this.firebaseUser = user;
  }

  static Future<FireBaseApi> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    assert(user.email != null);
    assert(user.displayName != null);

    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return FireBaseApi(user);
  }

  static Future<FireBaseApi> signInWithFacebook() async {
    final FacebookLoginResult facebookResult =
        await _facebookLogin.logInWithReadPermissions(['email']);
    if ( facebookResult.status == FacebookLoginStatus.loggedIn ){

    final FacebookAccessToken token = facebookResult.accessToken;
    
    final FirebaseUser user = await _auth.signInWithFacebook(
      accessToken: token.token,
    );

    assert(user.email != null);
    assert(user.displayName != null);

    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return FireBaseApi(user);
    } else {
      print("sorry, too bad. ${facebookResult.status}");
      return null;
    }
  }
}
