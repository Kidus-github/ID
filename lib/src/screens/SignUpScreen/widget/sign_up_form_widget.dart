import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/controllers/signup_controller.dart';
import 'package:id/src/models/user_model.dart';
import 'package:id/src/utils/validators/validation.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = SignUpController.instance;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      Validator.validateEmptyText('First Name', value),
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
                  validator: (value) =>
                      Validator.validateEmptyText('Middle Name', value),
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
                  validator: (value) => Validator.validatePhoneNumber(value),
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
                  validator: (value) => Validator.validateEmail(value),
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
                Obx(
                  () => TextFormField(
                    controller: controller.password,
                    validator: (value) => Validator.validatePassword(value),
                    obscureText: controller.hidepassword.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.fingerprint),
                      labelText: kSignUpText8,
                      hintText: kSignUpText8,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidepassword.value =
                              !controller.hidepassword.value,
                          icon: Icon(controller.hidepassword.value
                              ? Icons.visibility_off
                              : Icons.remove_red_eye)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        GestureDetector(
          onTap: () {
            controller.signup();
          },
          //   if (controller.formKey.currentState!.validate()) {
          //     SignUpController.instance.registerUser(
          //         context,
          //         controller.email.text.trim(),
          //         controller.password.text.trim());
          //     SignUpController.instance.createUser(UserModel(
          //         createdAt: DateTime.now(),
          //         firstName: controller.firstName.text.trim(),
          //         email: controller.email.text.trim(),
          //         middleName: controller.middleName.text.trim(),
          //         nfcTagId: "",
          //         phoneNo: controller.phoneNo.text.trim(),
          //         updatedAt: DateTime.now(),
          //         role: null));
          //   }

          //   controller.email.clear();
          //   controller.firstName.clear();
          //   controller.middleName.clear();
          //   controller.phoneNo.clear();
          //   controller.password.clear();
          // },

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
