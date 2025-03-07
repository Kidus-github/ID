import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/utils/validators/validation.dart';

import '../../../constants/text_string.dart';
import '../../../controllers/attende_controller.dart';

class AddAttendeForm extends StatelessWidget {
  const AddAttendeForm({super.key, required this.attendanceClassId});
  final String attendanceClassId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = AttendeController.instance;

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
                  controller: controller.nickName,
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
                Obx(
                  () => Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.transgender_outlined,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              elevation: 3,
                              value: controller.genderOption.value,
                              items: controller.gender
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                controller.genderOption.value = val as String;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  controller: controller.batchName,
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
                  controller: controller.section,
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
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        GestureDetector(
          onTap: () {
            controller.addAttende(attendanceClassId);
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
