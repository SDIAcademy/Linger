import 'package:firebase_auth/firebase_auth.dart';
import 'package:linger/presenters/user.dart';
import 'package:redux/redux.dart';

class AppState {
  final user;
  AppState({ this.user });
  AppState.initialState() : user = null;
}

class LoginAction{
  var user;
  LoginAction({this.user});
}

AppState reducer(AppState prev, action) {
  if (action is LoginAction) {
    FirebaseUser _userRef;
    _userRef = action.user;
    User _user = User(userRef: _userRef);
    return AppState(user: _user);
  }
  return prev;
}


final store = Store(reducer, initialState: AppState.initialState());
