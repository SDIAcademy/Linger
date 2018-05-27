import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
import 'package:linger/presenters/redux.dart';
import './views/main_page.dart';
import './views/email_form.dart';

void main() {
  return runApp(Linger());
}

class Linger extends StatelessWidget {
  
  // final store = Store<AppState>(reducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    print(store.state);
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: "Linger",
        theme:
            ThemeData(primarySwatch: Colors.blue, indicatorColor: Colors.blue),
        home:
        MainPage(),
        routes: <String, WidgetBuilder>{
          '/emailForm': (BuildContext context) => EmailForm(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
