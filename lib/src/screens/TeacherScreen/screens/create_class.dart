import 'package:flutter/material.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({super.key});

  @override
  State<CreateClass> createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const Text(
                kPageTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffD9D9D9),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> classes = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 09, 00, 00);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  classes.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: "Conference",
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=10'));

  return classes;
}

class ClassDataSource extends CalendarDataSource {
  ClassDataSource(List<Appointment> source) {
    appointments = source;
  }
}
