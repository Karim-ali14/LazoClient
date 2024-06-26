import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import '../../../../Theme/AppTheme.dart';

class TimerText extends StatefulWidget {
  final int? durationSeconds;
  final VoidCallback? onTimerFinish;
  const TimerText({super.key,this.durationSeconds,this.onTimerFinish});

  @override
  State<TimerText> createState() => TimerTextState();
}

class TimerTextState extends State<TimerText> {

  final StreamController<int> _timerStreamController = StreamController<int>();
  late Timer _timer;
  int _secondsElapsed = 0;
  int _totalSeconds = 90;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _timerStreamController.stream,
      initialData: _totalSeconds,
      builder: (context, snapshot) {
        return RichText(
          text: TextSpan(
            text: "Verification code will be sent within ",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: _formatDuration(snapshot.data!),
                style: const TextStyle(
                  color: AppTheme.mainAppColor, // Set the color to green
                  fontSize: 16.0,
                  decoration: TextDecoration.underline, // Underline the text
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.durationSeconds ?? 90;
    _startTimer();
  }

  @override
  void dispose() {
    _timerStreamController.close();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsElapsed++;
      if (_secondsElapsed >= _totalSeconds) {
        widget.onTimerFinish?.call();
        _timer.cancel();
      }
      _timerStreamController.sink.add(_totalSeconds - _secondsElapsed);
    });
  }

  void restart(){
    setState(() {
      _timer.cancel();
      _totalSeconds = widget.durationSeconds ?? 90;
      _secondsElapsed = 0;
    });
    _startTimer();
  }

  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

}
