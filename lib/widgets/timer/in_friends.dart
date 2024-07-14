import 'package:flutter/material.dart';

class in_frends extends StatelessWidget {
  const in_frends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/avatar1.png'),
        ),
        SizedBox(width: 10),
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/avatar2.png'),
        ),
        SizedBox(width: 10),
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/avatar3.png'),
        ),
        SizedBox(width: 10),
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/avatar4.png'),
        ),
      ],
    );
  }
}
