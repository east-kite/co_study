import 'package:co_study/widgets/timeline/friends_tab.dart';
import 'package:co_study/widgets/timeline/national_tab.dart';
import 'package:co_study/widgets/timeline/school_tab.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイムライン'),
      ),
      body: DefaultTabController(
        length: 3, // タブの数
        child: Column(
          children: <Widget>[
            const TabBar(
              tabs: [
                Tab(text: '友だち'),
                Tab(text: "校内"),
                Tab(text: "全国"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 友だち
                  FriendsTab(),
                  // 校内
                  const SchoolTab(),
                  // 全国
                  const NationalTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
