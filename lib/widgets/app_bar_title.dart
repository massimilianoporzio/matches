import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset('lib/resources/images/ball.png'),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text('Partite'),
        )
      ],
    );
  }
}
