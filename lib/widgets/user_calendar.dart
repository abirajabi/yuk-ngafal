import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:yuk_ngafal/common/color_style.dart';

class UserCalendar extends StatelessWidget {
  const UserCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      viewHeaderStyle: const ViewHeaderStyle(backgroundColor: celticBlue),
      view: CalendarView.month,
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.schedule,
        CalendarView.timelineWeek,
        CalendarView.month
      ],
    );
  }
}
