import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yuk_ngafal/common/color_style.dart';

class QuranTabs extends StatelessWidget {
  const QuranTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        const TabBar(
          labelColor: celticBlue,
          unselectedLabelColor: blackGrey,
          tabs: [
            Tab(
              text: 'Surah',
            ),
            Tab(
              text: 'Juz',
            ),
          ],
        ),
      ),
      pinned: true,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
        color: tabBase,
        borderRadius: BorderRadius.circular(25),
      ),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => 7.h;

  @override
  double get minExtent => 7.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
