import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/password_controller.dart';
import 'package:id/src/controllers/signin_controller.dart';
import 'package:id/src/screens/ForgetPasswordScreen/forget_password_screen/forget_password_model_bottom_sheet.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = PasswordController.instance;
    final controller = SignInController.instance;
    final _formKey = GlobalKey<FormState>();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.email,
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
                  controller: controller.password,
                  obscureText: passwordController.isPasswordHidden.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.fingerprint),
                      labelText: kSignInText5,
                      hintText: kSignInText5,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed:
                              passwordController.togglePasswordVisibility,
                          icon: Icon(passwordController.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.remove_red_eye))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.06,
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
            height: size.height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                SignInController.instance.loginUser(
                    controller.email.text.trim(),
                    controller.password.text.trim());
              }
            },
            child: Center(
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
          ),
        ],
      ),
    );
  }
}
