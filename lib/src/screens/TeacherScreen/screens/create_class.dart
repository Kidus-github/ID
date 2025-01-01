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
                height: 3.0,
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffD9D9D9),
              ),
              const SizedBox(
                height: 3.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: kNameHint,
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                      Container(
                        width: double.infinity,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Checkbox(value: true, onChanged: null),
                            Text(kOneDayEvent)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                kFrom,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 0.3,
                                          style: BorderStyle.solid,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside)),
                                  padding: const EdgeInsets.all(6.0),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(kEndDateSelected),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(kEndTimeSelected),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.edit_calendar_outlined)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(kTo,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 0.5,
                                          style: BorderStyle.solid,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside)),
                                  padding: const EdgeInsets.all(6.0),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(kEndDateSelected),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(kEndTimeSelected),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.edit_calendar_outlined)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: kRepeat,
                            hintText: kOneDayEvent,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: kDescription,
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: kAddCoTeacher,
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintText: "None",
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: kLocation,
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            suffixIcon: Icon(
                              Icons.add_location,
                              color: Color(0xff737373),
                              size: 26,
                            ),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 44.0)),
                        child: const Text(
                          kPageTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              )
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
//  this is would be edited to a text box file
  return classes;
}

class ClassDataSource extends CalendarDataSource {
  ClassDataSource(List<Appointment> source) {
    appointments = source;
  }
}
