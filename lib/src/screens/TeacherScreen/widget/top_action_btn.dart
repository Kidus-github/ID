import 'package:flutter/material.dart';

class TopActionButton extends StatelessWidget {
  const TopActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.ontap,
  });
  final String text;
  final IconData icon;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.0,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              text,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
