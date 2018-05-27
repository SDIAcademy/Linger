import '../config/navigator_button_data.dart';
import '../models/user_progress.dart';

class User{
  var userRef;
  String id, name;
  User({ this.userRef, this.id, this.name});

  // void getProgress(){
  // Implement with local database, if no response, find remote database.
  num getProgress(title){
    return userProgress(title);
  }
}

