import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/SignInScreen/sign_in_screen.dart';
import 'package:id/src/screens/SignUpScreen/widget/sign_up_footer_widget.dart';
import 'package:id/src/screens/SignUpScreen/widget/sign_up_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(kLogo),
                  width: size.width * 0.09,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    kSignUpText1,
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: kSignUpText2, style: TextStyle(fontSize: 14)),
                    TextSpan(
                      text: kSignUpText3,
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
                                  builder: (context) => const SignInScreen()));
                        },
                    )
                  ], style: const TextStyle(color: Colors.black)),
                ),
                const SignUpFormWidget(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(kSignUpText10),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                        ),
                      )
                    ],
                  ),
                ),
                const SignUpFooterWidget(
                  icon: Bootstrap.google,
                  text: kSignUpText11,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SignUpFooterWidget(
                  icon: Bootstrap.apple,
                  text: kSignUpText12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
