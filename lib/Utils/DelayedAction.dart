import 'dart:async';

class DelayedAction {
  Timer? timer;

  void startTimer(Duration duration , Function() callback){
    cancelTimer();
    timer = Timer(duration,callback);
  }

  void cancelTimer(){
    timer?.cancel();
    timer = null;
  }
}