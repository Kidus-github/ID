import 'package:flutter/material.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/repository/authentication_repository/authentication_repository.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, -4),
          )
        ],
        color: const Color(0xffD9D9D9).withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black,
            ),
            child: const Image(
              image: AssetImage(kHomeLight),
              width: 32,
              height: 32,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // color: Colors.black,
            ),
            child: const Image(
              image: AssetImage(kCalanderDark),
              width: 32.0,
              height: 32.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // color: Colors.black,
            ),
            child: const Image(
              image: AssetImage(kNotificationDark),
              width: 32.0,
              height: 32.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              AuthenticationRepository.instance.logout();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // color: Colors.black,
              ),
              child: const Image(
                image: AssetImage(kSettingDark),
                width: 32.0,
                height: 32.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
