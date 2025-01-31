import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  DatePicker({
    super.key,
    required this.kType,
    required this.kDateSelected,
  });
  final String kType;
  final BoardDateTimeController kDateSelected;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectDateTime = DateTime.now();

  void _chooseDateTime(BuildContext context) {
    showBoardDateTimePicker(
      onChanged: (val) {
        setState(() {
          _selectDateTime = val;
          // kDateSelected = val;
        });
      },
      controller: widget.kDateSelected,
      context: context,
      pickerType: DateTimePickerType.datetime,
      initialDate: _selectDateTime,
      options: const BoardDateTimeOptions(
        languages: BoardPickerLanguages(
            today: 'Today', tomorrow: 'Tommorow', now: 'Now'),
        startDayOfWeek: DateTime.monday,
        pickerFormat: PickerFormat.dmy,
        activeColor: Colors.black87,
        backgroundDecoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.kType,
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
              Row(
                children: [
                  Text(
                      '${_selectDateTime.day},${_selectDateTime.month},${_selectDateTime.year}'),
                  const SizedBox(
                    width: 6,
                  ),
                  Text('${_selectDateTime.hour}:${_selectDateTime.minute} AM'),
                ],
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
