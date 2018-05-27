import 'package:flutter/material.dart';
import '../util/login_button.dart';
import 'package:linger/presenters/redux.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return selectionPage();
  }

  Widget selectionPage() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(42, 42, 42, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: button(title: 'Google', url: 'assets/google.png'),
              onPressed: () {
                store.dispatch(LoginAction());
              },
              color: Colors.white,
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            MaterialButton(
              child: button(title: 'Facebook', url: 'assets/facebook.png', color: Colors.white),
              onPressed: () {
                store.dispatch(LoginAction());
              },
              color: Color.fromRGBO(58, 89, 152, 1.0),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "or",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFFD2D2D2),
                ),
              ),
            ),
            MaterialButton(
              child: button(title: 'email', color: Colors.white),
              onPressed: () {
                store.dispatch(LoginAction());
                Navigator.of(context).pushNamed('/emailForm');
              },
              color: Colors.redAccent[400],
            ),
          ],
        ),
      ),
    );
  }
}
