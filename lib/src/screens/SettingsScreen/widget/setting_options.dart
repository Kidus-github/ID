import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    super.key,
    required this.title,
    required this.prefixicon,
    required this.onPress,
  });

  final String title;
  final IconData prefixicon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      prefixicon,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18.0),
                    ),
                  ],
                ),
                const Icon(
                  Icons.navigate_next_outlined,
                  size: 32,
                )
              ],
            ),
          ),
          Container(
            height: 1.5,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
