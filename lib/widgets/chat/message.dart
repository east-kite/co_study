import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final bool isSystem;
  final String senderName;
  final String sendtime;

  const MessageWidget({
    required this.message,
    required this.isMe,
    required this.isSystem,
    required this.senderName,
    required this.sendtime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              if (!isMe)
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('images/avatar1.png'),
                  ),
                ),
              Flexible(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  decoration: BoxDecoration(
                    color: isSystem
                        ? Colors.grey[300]
                        : (isMe
                            ? const Color.fromARGB(255, 48, 255, 86)
                            : Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMe)
                        Text(
                          senderName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        sendtime,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 8),
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
