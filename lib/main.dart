import 'package:co_study/widgets/chat_page.dart';
import 'package:co_study/widgets/record_page.dart';
import 'package:co_study/widgets/solo_timer_page.dart';
import 'package:co_study/widgets/timeline_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TimelinePage(),
    SoloTimerPage(),
    RecordPage(),
    ChatPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<String> _titles = ['タイムライン', 'タイマー', '記録', 'チャット'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'タイムライン',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'タイマー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: '記録',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'チャット',
          )
        ],
      ),
    );
  }
}
