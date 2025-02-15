import 'package:flutter/material.dart';
import 'package:id/src/common_widget/bottom_nav_bar.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/class_controller.dart';
import 'package:id/src/screens/TeacherScreen/widget/calendar.dart';
import 'package:id/src/screens/TeacherScreen/widget/check_box_for_event.dart';
import 'package:id/src/screens/TeacherScreen/widget/class_action_btn.dart';
import 'package:id/src/screens/TeacherScreen/widget/class_text_field.dart';
import 'package:id/src/screens/TeacherScreen/widget/date_picker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../utils/validators/validation.dart';

class CreateClass extends StatelessWidget {
  const CreateClass({
    super.key,
    required this.pageTitle,
  });
  final String pageTitle;
// List<Appointment> classes = <Appointment>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime = controller.startt;
//     final DateTime endTime = startTime.add(const Duration(hours: 2));

//     classes.add(Appointment(
//         startTime: startTime,
//         endTime: endTime,
//         subject: "Conference",
//         color: Colors.blue,
//         recurrenceRule: 'FREQ=DAILY;COUNT=10'));
  @override
  Widget build(BuildContext context) {
    final controller = ClassController.instance;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                Text(
                  pageTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32.0),
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
                TextFormField(
                  //Name of the event or class
                  controller: controller.className,
                  validator: (value) =>
                      Validator.validateEmptyText('Class Name', value),
                  decoration: const InputDecoration(
                      hintText: kNameHint,
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder()),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Calendar(
                            // datasource: controller
                            //     .dataSourse
                            ), //calander to be selected or to show the dates selected
                        OneDayEventCheckBox(controller: controller),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DatePicker(
                              //start date selected
                              dateSelected: controller.startDateTime,
                              kType: kFrom,
                            ),
                            DatePicker(
                              //end date selected
                              dateSelected: controller.endDateTime,
                              kType: kTo,
                            ),
                          ],
                        ),
                        ClassTextFields(
                            controller: controller), //text field datas
                        ClassActionBtn(
                          pageTitle: pageTitle,
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> classes = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime.now();
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
