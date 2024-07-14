import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('記録'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 180, 178, 178)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: 'プリント(物理)',
                onChanged: (String? newValue) {},
                items: <String>['プリント(物理)', '参考書(物理)', '過去問(物理)']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: SizedBox(
                      width: 200,
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/book.png'),
                          const SizedBox(width: 10),
                          Text(value),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'コメントを入力',
                  ),
                  maxLines: 10,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  _commentController.clear(); // コメントクリア
                },
                child: const Text('投稿'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
