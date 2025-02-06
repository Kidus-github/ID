import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/signin_controller.dart';
import 'package:id/src/screens/SignInScreen/widget/header.dart';
import 'package:id/src/screens/SignInScreen/widget/sign_in_form_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(SignInController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(size: size),
                SignInFormWidget(size: size),
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
                        child: Text(kSignInText8),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.googleSignIn(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Bootstrap.google,
                          size: 21,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          kSignInText9,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Bootstrap.apple),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            kSignInText10,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
