import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  kWelcomeText1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kBoxBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        )
                      ]),
                  padding: const EdgeInsets.all(20),
                  width: size.width * 0.6,
                  child: Column(
                    children: [
                      const Image(image: AssetImage(kWelcomeImage1)),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      const Text(
                        kWelcomeText2,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kBoxBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25), // Shadow color
                          spreadRadius: 0, // How far the shadow spreads
                          blurRadius: 4, // Softness of the shadow
                          offset: const Offset(0, 4), // Position of the shadow
                        )
                      ]),
                  width: size.width * 0.6,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Image(image: AssetImage(kWelcomeImage2)),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      const Text(
                        kWelcomeText3,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                width: size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kBoxBgColor,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(6, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.25))
                    ]),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      kWelcomeText4,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
