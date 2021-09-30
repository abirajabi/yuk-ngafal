import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:yuk_ngafal/common/color_style.dart';
import 'package:yuk_ngafal/ui/goal_page/goal_page.dart';
import 'package:yuk_ngafal/ui/quran_home/quran_home.dart';
import 'package:yuk_ngafal/ui/settings_page/settings_page.dart';
import 'package:yuk_ngafal/ui/statistics_page/statistics_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User _user;

  int _selectedIndex = 0;

  static final List<BottomNavigationBarItem> _bottomNavbarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Quran',
    ),
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Test'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart),
      label: 'Statistics',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  static const List<Widget> _listWidget = [
    QuranHomePage(),
    GoalPage(),
    StatisticsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _user = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _listWidget.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: celticBlue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: _bottomNavbarItems,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
