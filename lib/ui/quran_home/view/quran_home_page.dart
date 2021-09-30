import 'package:flutter/material.dart';
import 'package:yuk_ngafal/ui/quran_home/widgets/quran_home_header.dart';
import 'package:yuk_ngafal/ui/quran_home/widgets/quran_tabs.dart';

class QuranHomePage extends StatelessWidget {
  const QuranHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            const QuranHomeHeader(),
            const QuranTabs(),
          ];
        },
        body: const CustomScrollView(),
      ),
    );
  }
}
