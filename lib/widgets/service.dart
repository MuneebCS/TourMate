import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Service extends StatelessWidget {
  final String count;
  final String head;
  final String desc;

  const Service({
    super.key,
    required this.count,
    required this.head,
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
            head,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ]),
        const SizedBox(
          height: 15,
        ),
        Text(
          desc,
          style: GoogleFonts.montserrat(
              color: Theme.of(context).hintColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
