import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:yuk_ngafal/common/color_style.dart';

class LastReadCard extends StatelessWidget {
  const LastReadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Card(
              elevation: 2,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/quran2.svg',
                    color: danube,
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Last read',
                        style: TextStyle(color: blackGrey),
                      ),
                      Text('Ayat', style: TextStyle(color: danube)),
                    ],
                  ),
                ],
              )),
        ));
  }
}
