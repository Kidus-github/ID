import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';

class OneDayEventCheckBox extends StatelessWidget {
  const OneDayEventCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Checkbox(value: true, onChanged: null), Text(kOneDayEvent)],
      ),
    );
  }
}
