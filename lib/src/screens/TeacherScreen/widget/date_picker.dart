import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.kType,
    required this.kDateSelected,
    required this.kTimeSelected,
  });
  final String kType;
  final String kDateSelected;
  final String kTimeSelected;

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
        GestureDetector(
          child: Container(
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
                    Text(kDateSelected),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(kTimeSelected),
                  ],
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Icon(Icons.edit_calendar_outlined)
              ],
            ),
          ),
        )
      ],
    );
  }
}
