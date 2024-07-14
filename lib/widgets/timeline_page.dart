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
              tabs: [Tab(text: '友だち'), Tab(text: "校内"), Tab(text: "全国")],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // 友だち
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/ranking.png',
                          width: 250,
                          height: 250,
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/avatar1.png'),
                                    radius: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'たろう',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '本日の記録 : 1時間 15分',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '物理のテスト範囲終わった！',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'images/book.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text('プリント(物理)'),
                                  ],
                                ),
                              ),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '11:35 AM',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 校内
                  const Center(
                    child: Text('タブ2の内容'),
                  ),
                  // 全国
                  const Center(
                    child: Text('タブ3の内容'),
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
