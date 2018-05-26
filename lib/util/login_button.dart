import 'package:flutter/material.dart';

Widget button(title, uri, [color = const Color.fromRGBO(68, 68, 76, .8) ]) {
  return Container(
    width: 190.0,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          leading(uri),
          Padding(
            child: Text(
              "Sign in with $title",
              style:  TextStyle(
                fontFamily: 'Roboto',
                color: color,
              ),
            ),
            padding: new EdgeInsets.only(left: 20.0),
          ),
        ],
      ),
    ),
  );
}

Widget leading(uri){
  if (uri == "")
    return Container(
      width: 25.0,
      child: Icon(
        Icons.email,
      ),
    );
  return Image.asset(
      uri,
      width: 25.0,
    );

}