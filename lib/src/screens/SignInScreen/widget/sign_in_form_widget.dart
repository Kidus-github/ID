import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/ForgetPasswordScreen/forget_password_screen/forget_password_model_bottom_sheet.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: kSignInText4,
                    hintText: kSignInText4,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint),
                      labelText: kSignInText5,
                      hintText: kSignInText5,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: null, icon: Icon(Icons.remove_red_eye))),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              ForgotPasswordScreen.buildShowModelBottomSheet(context);
            },
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                kSignInText6,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: Container(
              width: size.width * 0.7,
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 111.0),
              decoration: BoxDecoration(
                color: kDarkColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(kSignInText7,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
