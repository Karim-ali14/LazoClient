import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../Localization/Keys.dart';
import '../../../../Theme/AppTheme.dart';

class TimerText extends StatefulWidget {
  final int? durationSeconds;
  final VoidCallback? onResendOtp;
  const TimerText({super.key, this.durationSeconds, this.onResendOtp});

  @override
  State<TimerText> createState() => TimerTextState();
}

class TimerTextState extends State<TimerText> {
  final StreamController<int> _timerStreamController = StreamController<int>();
  late Timer _timer;
  int _secondsElapsed = 0;
  int _totalSeconds = 90;
  ValueNotifier<bool> readyToResendOtp = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _timerStreamController.stream,
      initialData: _totalSeconds,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "(${_formatDuration(snapshot.data!)})",
                style: AppTheme
                    .styleWithTextAppGrey18AdelleSansExtendedFonts14w400,

                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                if (readyToResendOtp.value) {
                  readyToResendOtp.value = false;
                  widget.onResendOtp?.call();
                }
              },
              child: ValueListenableBuilder(
                builder: (context, value, _) {
                  return Text(" ${context.tr(resendVerificationCodeKey)}",
                      style: AppTheme
                          .styleWithTextAppGrey18AdelleSansExtendedFonts14w400
                          .copyWith(
                              decoration: TextDecoration.underline,
                              color: !readyToResendOtp.value
                                  ? AppTheme.appGrey18
                                  : AppTheme.mainAppColorDark));
                },
                valueListenable: readyToResendOtp,
              ),
            )
          ],
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
        readyToResendOtp.value = true;
        _timer.cancel();
      }
      _timerStreamController.sink.add(_totalSeconds - _secondsElapsed);
    });
  }

  void restart() {
    setState(() {
      _timer.cancel();
      _totalSeconds = widget.durationSeconds ?? 90  ;
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
