import 'package:flutter/material.dart';
import '../util/login_button.dart';
import 'package:linger/presenters/redux.dart';
import '../util/flutter_auth.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(42, 42, 42, 1.0),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: NetworkImage(
                "https://images.homedepot-static.com/productImages/e8ff78f4-5f22-408e-bce3-2bec3f1b3cc6/svn/saratoga-hickory-trafficmaster-laminate-wood-flooring-34089-64_1000.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "linger",
                  style: TextStyle(
                    fontSize: 120.0,
                    fontFamily: 'Trattatello',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                StoreConnector<AppState, dynamic>(
                  converter: (store) => ({user, pending}) {
                        if (user != null)
                          store.dispatch(LoginAction(user: user));
                        if (pending != null)
                          store.dispatch(LoadingAction(pending: pending));
                      },
                  builder: (context, viewModel) => new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MaterialButton(
                            child: button(
                                title: 'Google', url: 'assets/google.png'),
                            onPressed: () => FireBaseApi.loginUser(
                                method: "google", viewModel: viewModel),
                            color: Colors.white,
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          MaterialButton(
                            child: button(
                                title: 'Facebook',
                                url: 'assets/facebook.png',
                                color: Colors.white),
                            onPressed: () => FireBaseApi.loginUser(
                                method: "facebook", viewModel: viewModel),
                            color: Color.fromRGBO(58, 89, 152, 1.0),
                          ),
                        ],
                      ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "- or -",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFFD2D2D2),
                      fontFamily: 'Trattatello',
                    ),
                  ),
                ),
                MaterialButton(
                  child: button(title: 'email', color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/emailForm');
                  },
                  color: Colors.redAccent[400],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
