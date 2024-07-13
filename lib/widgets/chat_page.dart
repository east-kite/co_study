import 'package:co_study/main.dart';
import 'package:co_study/widgets/group_timer_page.dart';
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
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 196, 249, 1),
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
                    message: '25分達成しました！\n2回目の達成です!\n本日累計： 0時間50分　　　　',
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
          _TextInput(),
        ],
      ),
    );
  }

  Widget _TextInput() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'メッセージを入力してください',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              navigatorKey.currentState!.push(
                MaterialPageRoute(
                    builder: (BuildContext context) => GroupTimerPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // メッセージ送信処理
            },
          ),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final bool isSystem;
  final String senderName;
  final String sendtime; // 変数

  const MessageWidget({
    required this.message,
    required this.isMe,
    required this.isSystem,
    required this.senderName,
    required this.sendtime, // コンストラクタ
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMe) // isMeがfalse（相手のメッセージ）の場合にアイコンを表示
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/avatar.png'), // 顔写真の画像
                  ),
                ),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 250),
                  decoration: BoxDecoration(
                    color: isSystem
                        ? Colors.grey[300]
                        : (isMe
                            ? Color.fromARGB(255, 48, 255, 86)
                            : Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMe)
                        Text(
                          senderName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      SizedBox(height: 4), // 名前とメッセージの間隔を調整
                      Text(
                        message,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 2),
                      Text(
                        sendtime,
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
