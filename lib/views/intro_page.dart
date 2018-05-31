import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => new _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
          child: Center(
          child: Text("IntroPage", style: Theme.of(context).textTheme.body1),
        ),
      ),
    );
  }
}