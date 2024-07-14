import 'package:flutter/material.dart';

class timer_rap extends StatelessWidget {
  const timer_rap({
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
              "Rap 2",
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
