import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final String count;
  final String Head;
  final String desc;

  Service({
    required this.count,
    required this.Head,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            count,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            Head,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ]),
        const SizedBox(
          height: 15,
        ),
        Text(
          desc,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
