import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text(kWelcomeText1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child:const  Column(
                      children: [
                        Image(image: AssetImage(kWelcomeText1)),
                        Text(kWelcomeText2)
                      ],
                    ),
                  
                  GestureDetector ( 
                    onTap: (){}
                    child: Column(
                    children: [
                      Image(image: AssetImage(kWelcomeText2)),
                      Text(kWelcomeText3)
                    ],
                  )),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
