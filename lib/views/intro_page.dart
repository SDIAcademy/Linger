import 'package:flutter/material.dart';
import 'package:linger/presenters/redux.dart';
import 'package:linger/views/loading_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linger/util/flutter_auth.dart';
import 'package:redux/redux.dart';

class IntroPage extends StatefulWidget {
  final Store store;
  IntroPage(this.store);
  @override
  _IntroPageState createState() => new _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool hasLoadUser;
  @override
  void initState() {
    super.initState();
    hasLoadUser = false;
    Function viewModel = ({user, pending}) {
      if (user != null) widget.store.dispatch(LoginAction(user: user));
      if (pending != null)
        widget.store.dispatch(LoadingAction(pending: pending));
    };
    FireBaseApi.loginUser(viewModel: viewModel, method: "google", silent: true);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => ({user, pending}) {
              if (user != null) store.dispatch(LoginAction(user: user));
              if (pending != null)
                store.dispatch(LoadingAction(pending: pending));
            },
        builder: (context, viewModel) {
          return Scaffold(
            body: LoadingPage(),
          );
        });
  }
}
