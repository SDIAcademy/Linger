import 'dart:async';

const timeout = const Duration(seconds: 3);
const ms = const Duration(milliseconds: 1);

startTimeout(handleTimeout, [int ms]) {
  var duration = Duration(milliseconds: ms);
  return Timer(duration, handleTimeout);
}
