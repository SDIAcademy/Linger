import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: 1.0,
        curve: Curves.easeIn,
              child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}