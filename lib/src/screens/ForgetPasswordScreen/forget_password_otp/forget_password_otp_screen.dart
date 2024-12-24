import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:id/src/constants/text_string.dart';

class ForgetPasswordOtpScreen extends StatelessWidget {
  const ForgetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kOtpTitle,
                style: GoogleFonts.montserrat(
                  fontSize: 98.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                kOtpSubTitle.toUpperCase(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                kOtpMessage + "support@gmail.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                keyboardType: TextInputType.number,
                onSubmit: (value) => print('OTP is => $value'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black, // Text and icon color
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          padding: const EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.0)) // Text style
                          ),
                      onPressed: () {},
                      child: const Text(kNext)))
            ],
          ),
        ),
      ),
    );
  }
}
