import 'package:flutter/material.dart';
import 'package:linger/config/navigator_button_data.dart';
import 'package:linger/presenters/redux.dart';
// import 'package:linger/presenters/redux.dart';
import 'login_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../util/semi_round_button.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => () => store.state.user,
        builder: (context, callback) {
          if (callback() == null) return LoginPage();
          return UserPage();
        });
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: NetworkImage("https://images.homedepot-static.com/productImages/e8ff78f4-5f22-408e-bce3-2bec3f1b3cc6/svn/saratoga-hickory-trafficmaster-laminate-wood-flooring-34089-64_1000.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    minRadius: 50.0,
                    child: Image.network(
                        "https://www.shareicon.net/data/128x128/2016/08/18/810199_user_512x512.png")),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                buttonItem(0),
                buttonItem(1),
                buttonItem(2),
                buttonItem(3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonItem(num index) {
    var data = navigatorButtonData[index];
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: SemiRoundedBorderButton(
        onPressed: () {},
        width: 280.0,
        height: 60.0,
        color: data.colorOverlay,
        radius: BorderRadius.all(Radius.circular(28.0)),
        background: NetworkImage(data.imageUrl),
        //  Color(0xFF83ADA8),
        child: Center(
          child: buttonText(data, index),
        ),
      ),
    );
  }

  Widget buttonText(data, index) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => () => store.state.user,
        builder: (ctx, callback) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '${callback().getProgress(navigatorTitles[index])}%',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          );
        });
  }
}

// Widget
