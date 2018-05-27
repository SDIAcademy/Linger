import 'package:linger/config/navigator_button_data.dart';

num userProgress(title) {
  List<num> progressValue = [10, 20, 30, 40];
  num progress;
  for (var i = 0; i < navigatorTitles.length; i++) {
    if (navigatorTitles[i] == title) {
      progress = progressValue[i];
    }
  }
  return progress;
}
