import 'package:co_study/widgets/timeline/timeline_post.dart';
import 'package:flutter/material.dart';

class FriendsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              Image.asset(
                'images/ranking.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 16.0),
              const TimelinePost(
                avatarImage: 'images/avatar1.png',
                userName: 'たろう',
                record: '本日の記録 : 1時間 15分',
                content: '物理のテスト範囲終わった！',
                attachmentImage: 'images/book.png',
                attachmentText: 'プリント(物理)',
                time: '11:35 AM',
              ),
              const TimelinePost(
                avatarImage: 'images/avatar2.png',
                userName: 'はなこ',
                record: '本日の記録 : 2時間 30分',
                content: '数学！',
                attachmentImage: 'images/book2.png',
                attachmentText: '参考書(数学)',
                time: '11:38 AM',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
