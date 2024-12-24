import 'package:flutter/material.dart';

import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/ForgetPasswordScreen/forget_password_mail_screen/forget_password_mail.dart';
import 'package:id/src/screens/ForgetPasswordScreen/forget_password_phone/forget_password_phone.dart';
import 'package:id/src/screens/ForgetPasswordScreen/forget_password_screen/widget/forget_password_btn_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context) => Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    kForgetPasswordTite,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    kForgetPasswordSubTitte,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 30.0),
                  ForgetPasswordBtnWidget(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPasswordMail(),
                        ),
                      );
                    },
                    title: kEmail,
                    subTitle: kResetViaEmail,
                    icons: Icons.mail_outline_rounded,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ForgetPasswordBtnWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordPhone()));
                    },
                    title: kPhoneNo,
                    subTitle: kResetViaPhone,
                    icons: Icons.mobile_friendly_rounded,
                  ),
                ],
              ),
            ));
  }
}
