import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/ForgetPasswordScreen/forget_password_screen/widget/forget_password_btn_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context) => Container(
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kForgetPasswordTite,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    kForgetPasswordSubTitte,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30.0),
                  ForgetPasswordBtnWidget(
                    title: kEmail,
                    subTitle: kResetViaEmail,
                    icons: Icons.mail_outline_rounded,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ForgetPasswordBtnWidget(
                    title: kPhoneNo,
                    subTitle: kResetViaPhone,
                    icons: Icons.mobile_friendly_rounded,
                  ),
                ],
              ),
            ));
  }
}
