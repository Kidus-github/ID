import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage(kLogo),
                width: size.width * 0.1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Text(
                  kSignInText1,
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(text: kSignInText2, style: TextStyle(fontSize: 14)),
                  TextSpan(
                    text: kSignInText3,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  )
                ], style: TextStyle(color: Colors.black)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: kSignInText4,
                          hintText: kSignInText4,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: kSignInText5,
                          hintText: kSignInText5,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  kSignInText6,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Center(
                child: Container(
                  width: size.width * 0.7,
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 111.0),
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(kSignInText8),
                    ),
                    Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Bootstrap.google,
                          size: 21,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          kSignInText9,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Bootstrap.apple),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          kSignInText10,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
