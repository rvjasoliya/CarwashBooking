import 'dart:async';

import 'package:carwash_booking/others/constants.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

int _startTime = 300;

class _CountDownTimerState extends State<CountDownTimer> {

  Timer _timer;

  void startTimer(int timerDuration) {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      _startTime = timerDuration;
    });
    const oneSec = const Duration(minutes: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_startTime < 1) {
            timer.cancel();
            //Navigator.pop(context);
          } else {
            _startTime -= 1;
          }
          print(_startTime);
        },
      ),
    );
  }

  void pauseTimer() {
    if (_timer != null) _timer.cancel();
  }

  void resumeTimer() => startTimer(_startTime);

  @override
  void initState() {
    startTimer(_startTime);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer(_startTime);
    return Container(
      margin: EdgeInsets.only(right: 20, top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      height: 50,
      width: 50,
      child: Text(
        '$_startTime',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
