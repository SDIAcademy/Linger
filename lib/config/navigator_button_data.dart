import 'package:flutter/material.dart';
List<String> navigatorTitles = [ "GENERAL", "DOCTORS VISIT", "WORK", "GROCERY SHOPPING" ];
class NavigatorButton {
  final String imageUrl, title;
  final Color colorOverlay;
  NavigatorButton(
      {this.title, this.imageUrl, this.colorOverlay});
}

final List<NavigatorButton> navigatorButtonData = [
  NavigatorButton(
      title: navigatorTitles[0],
      imageUrl:
          "http://www.apa.org/Images/cpse-teachinglearning-title_tcm7-209355.png",
      colorOverlay: Color(0x772f2f2f)),
  NavigatorButton(
      title: navigatorTitles[1],
      imageUrl:
          "https://1vss76nhhzx246bcn1bq1rv1cf7-wpengine.netdna-ssl.com/wp-content/uploads/sites/11/2018/05/choosing-a-doctor.png",
      colorOverlay: Color(0x772f2f2f)),
  NavigatorButton(
      title: navigatorTitles[2],
      imageUrl:
          "https://media.istockphoto.com/photos/man-working-at-a-factory-picture-id537388732?k=6&m=537388732&s=612x612&w=0&h=1h14d9h8-TcpWJbmneiyqKhsUFWkgnOsqwCz3lOm_Zg=",
      colorOverlay: Color(0x772f2f2f)),
  NavigatorButton(
      title: navigatorTitles[3],
      imageUrl:
          "https://atmedia.imgix.net/2d4ea32ed14a1f75cf1b454748dfa99cd4a1fa62?auto=format&q=45&w=398.0&fit=max&cs=strip",
      colorOverlay: Color(0x772f2f2f)),
];