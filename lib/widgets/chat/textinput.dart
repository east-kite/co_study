import 'package:co_study/widgets/group_timer_page.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
            icon: const Icon(Icons.call),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GroupTimerPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // メッセージ送信処理
            },
          ),
        ],
      ),
    );
  }
}
