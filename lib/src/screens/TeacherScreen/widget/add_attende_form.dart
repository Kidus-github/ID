import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/controllers/signup_controller.dart';
import 'package:id/src/utils/validators/validation.dart';

import '../../../constants/text_string.dart';

class AddAttendeForm extends StatelessWidget {
  const AddAttendeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = SignUpController.instance;
    // final controller;

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
                  controller: controller.middleName,
                  validator: (value) =>
                      Validator.validateEmptyText('Nick Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_3),
                    labelText: "Nick Name",
                    hintText: "Nick Name",
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
                  controller: controller.middleName,
                  validator: (value) =>
                      Validator.validateEmptyText('Batch', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.school_outlined),
                    labelText: "Batch",
                    hintText: "Batch",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: controller.middleName,
                  validator: (value) =>
                      Validator.validateEmptyText('Section', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.label_outline),
                    labelText: "Section",
                    hintText: "Section",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                ///
                ///nfcTag
                ///
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
                child: Text("Add",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
