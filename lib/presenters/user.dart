// import '../config/navigator_button_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_progress.dart';

class User{
  FirebaseUser userRef;
  String id, name;
  User({ this.userRef });

  // void getProgress(){
  // Implement with local database, if no response, find remote database.
  num getProgress(title){
    return userProgress(title);
  }
}

