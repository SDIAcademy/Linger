// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linger/presenters/redux.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My profile"),
      ),
      body: Center(
        child: StoreConnector<AppState, dynamic>(
          converter: (store) => store.state.user,
          builder: (BuildContext ctx, user) => Column(
                children: <Widget>[
                  Text(
                    user.userRef.displayName,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Trattatello',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(user.userRef.email),
                  Divider(height:10.0),
                  Container(
                    child: Text("some other user information"),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
