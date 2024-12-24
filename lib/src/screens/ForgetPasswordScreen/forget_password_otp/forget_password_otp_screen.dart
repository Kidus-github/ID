import 'package:flutter/material.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
