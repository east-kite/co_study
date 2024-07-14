import 'package:co_study/widgets/timer/chat_button.dart';
import 'package:co_study/widgets/timer/record_button.dart';
import 'package:co_study/widgets/timer/timer_day.dart';
import 'package:co_study/widgets/timer/timer_rap.dart';
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
  Color _containerColor = const Color.fromRGBO(180, 196, 249, 1); // タイマーの背景

  void _startTimer() {
    _isActive = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isActive = false;
          _timer.cancel();
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
      appBar: AppBar(
        title: const Text('タイマー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                color: _containerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  timer_day(),
                  timer_rap(),
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
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _resetTimer,
                        child: const Text('リセット'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _remainingTime = 300;
                  _isActive = false;
                  _timer.cancel();
                  _containerColor = Colors.yellow;
                });
              },
              child: const Text('デバック用'),
            ),
            const SizedBox(height: 100),
            const SizedBox(
              width: 200,
              child: record_button(),
            ),
            const SizedBox(height: 25),
            const SizedBox(
              width: 200,
              child: chat_button(),
            ),
          ],
        ),
      ),
    );
  }
}
