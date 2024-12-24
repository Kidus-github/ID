import 'package:flutter/material.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';
import 'package:id/src/screens/ForgetPasswordScreen/forget_password_otp/forget_password_otp_screen.dart';

class ForgetPasswordMail extends StatelessWidget {
  const ForgetPasswordMail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150.0),
                  Image(
                    image: const AssetImage(kForgot),
                    width: size.width * 0.5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Column(
                      children: [
                        Text(
                          kForgetPassword,
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          kForgetPasswordSubTitte,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text(kEmail),
                              hintText: kEmail,
                              prefixIcon: Icon(Icons.mail_outline_rounded)),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Colors.black, // Text and icon color
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    padding: const EdgeInsets.all(20.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)) // Text style
                                    ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetPasswordOtpScreen()));
                                },
                                child: const Text(kNext)))
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
