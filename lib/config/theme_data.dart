import 'package:flutter/material.dart';

class CustomTheme {
  static get theme {
    final originalTextTheme = ThemeData.dark().textTheme;
    final originalBody1 = originalTextTheme.body1;

    return ThemeData.dark().copyWith(
        primaryColor: Colors.grey[800],
        accentColor: Colors.cyan[300],
        buttonColor: Colors.cyan[800],
        textSelectionColor: Colors.cyan[100],
        backgroundColor: Colors.cyan[800],
        textTheme: originalTextTheme.copyWith(
            body1:
                originalBody1.copyWith(decorationColor: Colors.transparent)));
  }
}
