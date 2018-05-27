import 'package:flutter/material.dart';
import './views/main_page.dart';
import './views/email_form.dart';
void main() {return runApp(Linger());
}

class Linger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Linger",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        indicatorColor: Colors.blue
      ),
      home: MainPage(),
      routes: <String, WidgetBuilder> {
      '/emailForm': (BuildContext context) => EmailForm(),
    },
      debugShowCheckedModeBanner: false,
    );
  }
}