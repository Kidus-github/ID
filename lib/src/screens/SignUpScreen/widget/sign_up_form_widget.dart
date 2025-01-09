import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = SignUpController.instance;
    final _formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: kSignUpText4,
                    hintText: kSignUpText4,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: controller.middleName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: kSignUpText5,
                    hintText: kSignUpText5,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: controller.phoneNo,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.hail_sharp),
                    labelText: kSignUpText6,
                    hintText: kSignUpText6,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: kSignUpText7,
                    hintText: kSignUpText7,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: controller.password,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint),
                      labelText: kSignUpText8,
                      hintText: kSignUpText8,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: null, icon: Icon(Icons.remove_red_eye))),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              SignUpController.instance.registerUser(
                  context,
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
                child: Text(kSignUpText9,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
