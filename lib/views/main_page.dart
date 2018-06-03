import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linger/config/navigator_button_data.dart';
import 'package:linger/presenters/redux.dart';
// import 'package:linger/util/flutter_auth.dart';
// import 'package:linger/presenters/redux.dart';
import 'login_page.dart';
import 'loading_page.dart';
import 'intro_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../util/semi_round_button.dart';
import '../util/timer.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  bool intro;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intro = true;
    startTimeout(
        () => setState(() {
              intro = false;
            }),
        3000);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          if (intro)
            return IntroPage(store);
          // return IntroPage(store: store);
          else if (store.state.user == null) {
            if (store.state.pending) return LoadingPage();
            return LoginPage();
          } else {
            // store.dispatch(LoadingAction(pending: false));
            return UserPage();
          }
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
            image: AssetImage("assets/bg/wood.png"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                    stream: FirebaseAuth.instance.currentUser().asStream(),
                    builder: (BuildContext ctx,
                        AsyncSnapshot<FirebaseUser> snapshot) {
                      if (snapshot.data != null)
                        return CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(snapshot.data.photoUrl),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                            child: InkWell(
                              radius: 50.0,
                              onTap: () {
                                Navigator.of(ctx).pushNamed("/profile");
                              },
                            ),
                          ),
                        );
                      else
                        return CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.transparent,
                          child: null,
                        );
                    }),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                ),
                buttonItem(0, context),
                buttonItem(1, context),
                buttonItem(2, context),
                buttonItem(3, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonItem(num index, BuildContext ctx) {
    var data = navigatorButtonData[index];
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: SemiRoundedBorderButton(
        onPressed: () {
          print(data.quiz);
          Navigator.of(ctx).pushNamed(data.quiz);
        },
        width: 280.0,
        height: 60.0,
        color: data.colorOverlay,
        radius: BorderRadius.all(Radius.circular(10.0)),
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
        converter: (store) => store.state.user,
        builder: (ctx, user) {
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
                    fontSize: 25.0,
                    fontFamily: "Brela",
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${user.getProgress(navigatorTitles[index])}%',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: "Brela",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        });
  }
}

// Widget
