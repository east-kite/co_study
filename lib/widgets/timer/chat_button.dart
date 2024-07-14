import 'package:co_study/widgets/chat/chat_page.dart';
import 'package:flutter/material.dart';

class chat_button extends StatelessWidget {
  const chat_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      },
      child: const Text('チャットへ移動'),
    );
  }
}
