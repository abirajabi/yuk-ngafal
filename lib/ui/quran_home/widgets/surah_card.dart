import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
          child: const Text('1'),
        ),
        Column(
          children: [Text('')],
        )
      ],
    );
  }
}
