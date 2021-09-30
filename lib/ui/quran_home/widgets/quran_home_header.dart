import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yuk_ngafal/common/color_style.dart';
import 'package:yuk_ngafal/common/text_style.dart';
import 'package:yuk_ngafal/ui/quran_home/widgets/last_read.dart';

class QuranHomeHeader extends StatelessWidget {
  const QuranHomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 25.h,
      backgroundColor: celticBlue,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
      title: Text('Quran', style: whiteHeading16),
      centerTitle: true,
      shadowColor: danube,
      pinned: true,
      elevation: 1,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
    );
  }
}
