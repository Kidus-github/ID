import 'package:flutter/material.dart';
import 'package:id/src/constants/image_string.dart';

class Header extends StatelessWidget {
  Header({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(kLogo),
            width: size.width * 0.07,
          ),
          const Icon(
            Icons.help,
            size: 35.0,
            color: Color(0xff16161e),
          )
        ],
      ),
    );
  }
}
