import 'package:linger/presenters/user.dart';
import 'package:redux/redux.dart';

class AppState {
  final user;
  AppState({ this.user });
  AppState.initialState() : user = null;
}

class LoginAction{

}

AppState reducer(AppState prev, action) {
  if (action is LoginAction) {
    User _user;
    _user = User(name: "Z", userRef: "001");
    return AppState(user: _user);
  }
  return prev;
}


final store = Store(reducer, initialState: AppState.initialState());
