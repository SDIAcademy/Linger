/// This is a util function for generating the login buttons in the LoginPage,
/// Set the default value of fields: title, url, and color.
import 'package:flutter/material.dart';

num buttonWidth = 190.1;
num iconWidth = 25.1;
num middlePadding = 20.1;
const Color defaultFontColor = const Color.fromRGBO(68, 68, 76, .8);

Widget button({ title = "", url = "", color = defaultFontColor }) {
  return Container(
    width: buttonWidth,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leadingIcon(url),
          Padding(
            child: Text(
              "Sign in with $title",
              style:  TextStyle(
                fontFamily: 'Roboto',
                color: color,
              ),
            ),
            padding: new EdgeInsets.only(left: middlePadding),
          ),
        ],
      ),
    ),
  );
}

Widget leadingIcon(url){
  if (url == "")
    return Container(
      width: iconWidth,
      child: Icon(
        Icons.email,
        color: Colors.white,
      ),
    );
  return Image.asset(
      url,
      width: iconWidth,
    );

}