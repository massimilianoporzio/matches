import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CourtesyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const CourtesyWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
