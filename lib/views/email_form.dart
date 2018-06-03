import 'package:flutter/material.dart';
import 'package:linger/presenters/redux.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => new _EmailFormState();
}

class _EmailFormState extends State<EmailForm> with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  String _email, _username, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/bg/wood.png"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                    ),
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      labelText: "Email:",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                        decorationColor: Colors.grey,
                      ),
                    ),
                    validator: (str) =>
                        !str.contains('@') ? "Not a Valid Email!" : null,
                    onSaved: (str) => _email = str,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                    ),
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),),
                      labelText: "Username:",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                        decorationColor: Colors.grey,
                      ),
                    ),
                    validator: (str) =>
                        str.length <= 5 ? "Not a Valid Username!" : null,
                    onSaved: (str) => _username = str,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                    ),
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),),
                      labelText: "Password:",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                        decorationColor: Colors.grey,
                      ),
                    ),
                    validator: (str) =>
                        str.length <= 7 ? "Not a Valid Password!" : null,
                    onSaved: (str) => _password = str,
                    obscureText: true,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.cyanAccent.shade200,
                    elevation: 5.0,
                    child: MaterialButton(
                      height: 42.0,
                      minWidth: 400.0,
                      onPressed: handleSubmit,
                      color: Theme.of(context).buttonColor,
                      child: Text('Sign Up',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleSubmit() {
    var form = formKey.currentState;

    if (form.validate()) {
      // store.dispatch(LoginAction());
      form.save();
      setState(() {
        Navigator.of(context).pop();
      });
    }
  }
}
