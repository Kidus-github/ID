import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    super.key,
    required this.kType,
    required this.dateSelected,
  });
  final String kType;
  final Rx<DateTime> dateSelected;

  DateTime _selectDateTime = DateTime.now();

  void _chooseDateTime(BuildContext context) {
    BottomPicker.dateTime(
      pickerTitle: const Text(
        'Set the event exact time and date',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      onSubmit: (date) {
        dateSelected.value = date;
      },
      onCloseButtonPressed: () {
        print('Picker closed');
      },
      initialDateTime: dateSelected.value,
      gradientColors: [
        Color(0xfffdcbf1),
        Color(0xffe6dee9),
      ],
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kType,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                  color: Colors.black,
                  width: 0.3,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside)),
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Row(
                  children: [
                    Text(
                        '${dateSelected.value.day},${dateSelected.value.month},${dateSelected.value.year}'),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                        '${dateSelected.value.hour}:${dateSelected.value.minute} AM'),
                  ],
                ),
              ),
              // const SizedBox(
              //   width: 4.0,
              // ),
              IconButton(
                  onPressed: () => _chooseDateTime(context),
                  icon: const Icon(Icons.edit_calendar_outlined)),
            ],
          ),
        )
      ],
    );
  }
}
