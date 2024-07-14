import 'package:co_study/main.dart';
import 'package:co_study/widgets/record_page.dart';
import 'package:flutter/material.dart';

class record_button extends StatelessWidget {
  const record_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        navigatorKey.currentState!.push(
          MaterialPageRoute(builder: (BuildContext context) => RecordPage()),
        );
      },
      child: const Text('教材記録'),
    );
  }
}
