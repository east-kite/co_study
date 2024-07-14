import 'package:co_study/widgets/chat/message.dart';
import 'package:co_study/widgets/chat/textinput.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('🦄 Team Unicorns'),
            Text(
              '最終アクティブ：2時間前',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(180, 196, 249, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                children: const [
                  MessageWidget(
                    message: '物理のテスト範囲終わった！',
                    isMe: false,
                    isSystem: false,
                    senderName: "たろう",
                    sendtime: "17:35",
                  ),
                  MessageWidget(
                    message: '✍ 25分達成しました！\n㊗ 2回目の達成です!\n⏰ 本日累計： 0時間50分',
                    isMe: true,
                    isSystem: true,
                    senderName: "自分",
                    sendtime: "17:55",
                  ),
                  MessageWidget(
                    message: 'まだあと20ページもある😔\n今から夜ご飯まで勉強しよ',
                    isMe: true,
                    isSystem: false,
                    senderName: "自分",
                    sendtime: "17:56",
                  ),
                ],
              ),
            ),
          ),
          TextInputWidget(),
        ],
      ),
    );
  }
}
