import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3, // タブの数
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: [Tab(text: '友だち'), Tab(text: "校内"), Tab(text: "全国")],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 友だち
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text('タブ1の内容'),
                    ),
                  ),
                  // 校内
                  Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('タブ2の内容'),
                    ),
                  ),
                  // 全国
                  Container(
                    color: Colors.yellow,
                    child: Center(
                      child: Text('タブ3の内容'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
