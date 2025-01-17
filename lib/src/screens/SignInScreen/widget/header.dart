import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/SignUpScreen/sign_up_screen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(kLogo),
          width: size.width * 0.1,
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: const Text(
            kSignInText1,
            style: TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RichText(
          text: TextSpan(children: [
            const TextSpan(text: kSignInText2, style: TextStyle(fontSize: 14)),
            TextSpan(
              text: kSignInText3,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
            )
          ], style: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
