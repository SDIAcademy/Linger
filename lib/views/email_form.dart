import 'package:flutter/material.dart';
import 'package:linger/presenters/redux.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => new _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final formKey = GlobalKey<FormState>();

  String _email, _username, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
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
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
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
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
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
                  FlatButton(
                    child: Text("Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                    onPressed: handleSubmit,
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
      store.dispatch(LoginAction());
      form.save();
      setState(() {
        Navigator.of(context).pop();
      });
    }
  }
}
