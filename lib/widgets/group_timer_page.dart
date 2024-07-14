import 'package:co_study/widgets/timer/in_friends.dart';
import 'package:co_study/widgets/timer/record_button.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class GroupTimerPage extends StatefulWidget {
  @override
  _GroupTimerPageState createState() => _GroupTimerPageState();
}

class _GroupTimerPageState extends State<GroupTimerPage> {
  static const int _workDuration = 25 * 60; // 25 minutes
  int _remainingTime = _workDuration;
  bool _isActive = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer(); // initStateでタイマーを自動で起動する
  }

  void _startTimer() {
    _isActive = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isActive = false;
          _timer.cancel();
          // 終了時の処理を追加できます
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
        title: const Text('🦄 Team Unicorns のタイマー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 179, 236, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(maxWidth: 300),
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
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const in_frends(), // 参加している友達
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.mic_off,
                size: 60,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 200,
              child: record_button(),
            ),
          ],
        ),
      ),
    );
  }
}
