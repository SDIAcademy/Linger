import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:linger/config/theme_data.dart';
// import 'package:redux/redux.dart';
import 'package:linger/presenters/redux.dart';
import 'package:redux/redux.dart';
import './views/main_page.dart';
import './views/email_form.dart';
import './views/profile.dart';
import 'package:linger/views/quiz_views/general_quiz.dart';
import 'package:linger/views/quiz_views/doctor_quiz.dart';
import 'package:linger/views/quiz_views/work_quiz.dart';
import 'package:linger/views/quiz_views/shop_quiz.dart';

void main() {
  MaterialPageRoute.debugEnableFadingRoutes = true;
  return runApp(Linger());
}

class Linger extends StatelessWidget {
  final store = Store(reducer, initialState: AppState.initialState());
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: "Linger",
        theme: CustomTheme.theme,
        home:
        MainPage(),
        routes: <String, WidgetBuilder>{
          '/emailForm': (BuildContext context) => EmailForm(),
          '/profile': (BuildContext context) => Profile(),
          '/general_quiz': (BuildContext context) => GeneralQuiz(),
          '/doctor_quiz': (BuildContext context) => DoctorQuiz(),
          '/work_quiz': (BuildContext context) => WorkQuiz(),
          '/shopping_quiz': (BuildContext context) => ShopQuiz(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
