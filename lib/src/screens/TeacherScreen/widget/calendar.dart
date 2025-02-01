import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/screens/TeacherScreen/screens/create_class.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
  });
  // final datasource;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: Colors.black,
              width: 1.0,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignInside)),
      child: SfCalendar(
        view: CalendarView.month,
        cellBorderColor: Colors.black,
        todayHighlightColor: Colors.black,

        // initialDisplayDate: DateTime(2020, 11, 10, 08, 30),
        dataSource: ClassDataSource(getAppointments()),
      ),
    );
  }
}
