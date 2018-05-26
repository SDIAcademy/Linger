import 'package:flutter/material.dart';
import './views/main_page.dart';
void main() {return runApp(Linger());
}

class Linger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Linger",
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}