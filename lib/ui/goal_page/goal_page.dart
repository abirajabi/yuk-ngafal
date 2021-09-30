import 'package:flutter/material.dart';
import 'package:yuk_ngafal/widgets/user_calendar.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: UserCalendar(),
      ),
    );
  }
}
