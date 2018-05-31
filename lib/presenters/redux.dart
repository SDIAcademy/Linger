import 'package:firebase_auth/firebase_auth.dart';
import 'package:linger/presenters/user.dart';
// import 'package:redux/redux.dart';

class AppState {
  final user;
  bool pending;
  AppState({this.user, this.pending});
  AppState.initialState()
      : user = null,
        pending = false;
  AppState copyWith({
    bool pending,
    User user,
  }) {
    return AppState(
      pending: pending ?? this.pending,
      user: user ?? this.user,
    );
  }
}

class LoginAction {
  var user;
  LoginAction({this.user});
}

class LoadingAction {
  bool pending;
  LoadingAction({this.pending});
}

AppState reducer(AppState prev, action) {
  if (action is LoginAction) {
    FirebaseUser _userRef;
    _userRef = action.user;
    User _user = User(userRef: _userRef);
    return AppState(user: _user, pending: prev.pending);
  } else if (action is LoadingAction) {
    return AppState(pending: action.pending, user: prev.user);
  }
  return prev;
}
