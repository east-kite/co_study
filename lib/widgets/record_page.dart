import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('記録'), // ここにグループ名を動的に設定する必要があります
        ),
        body: Center(
          child: Text('Record Page'),
        ));
  }
}
