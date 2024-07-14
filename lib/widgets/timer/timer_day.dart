import 'package:flutter/material.dart';

class timer_day extends StatelessWidget {
  const timer_day({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "7/13",
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
