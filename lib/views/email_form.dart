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
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.blueGrey[200],
        padding: EdgeInsets.symmetric(horizontal: 70.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Email:",
                ),
                validator: (str) =>
                    !str.contains('@') ? "Not a Valid Email!" : null,
                onSaved: (str) => _email = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Username:",
                ),
                validator: (str) =>
                    str.length <= 5 ? "Not a Valid Username!" : null,
                onSaved: (str) => _username = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Password:",
                ),
                validator: (str) =>
                    str.length <= 7 ? "Not a Valid Password!" : null,
                onSaved: (str) => _password = str,
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                color: Colors.blueAccent[200],
                child: Text("Submit"),
                onPressed: handleSubmit,
              ),
            ],
          ),
        ),
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
