import 'package:flutter/material.dart';
import 'dart:async';

class SoloTimerPage extends StatefulWidget {
  @override
  _SoloTimerPageState createState() => _SoloTimerPageState();
}

class _SoloTimerPageState extends State<SoloTimerPage> {
  static const int _workDuration = 25 * 60; // 25 minutes in seconds
  int _remainingTime = _workDuration;
  bool _isActive = false;
  late Timer _timer;

  void _startTimer() {
    _isActive = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isActive = false;
          _timer.cancel();
          // 終了時
        }
      });
    });
  }

  void _stopTimer() {
    _isActive = false;
    _timer.cancel();
  }

  void _resetTimer() {
    _isActive = false;
    _timer.cancel();
    setState(() {
      _remainingTime = _workDuration;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secsStr = secs.toString().padLeft(2, '0');
    return '$minutesStr:$secsStr';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 196, 249, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "7/13",
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Rap 2",
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _formatTime(_remainingTime),
                      style: const TextStyle(fontSize: 72),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _isActive ? _stopTimer : _startTimer,
                        child: Text(_isActive ? '停止' : '開始'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _resetTimer,
                        child: Text('リセット'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 200),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text('教材記録'),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => {},
                child: Text('チャットへ移動'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
