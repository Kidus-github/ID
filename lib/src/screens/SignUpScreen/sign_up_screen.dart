import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:id/src/constants/colors.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(kLogo),
                  width: size.width * 0.09,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    kSignUpText1,
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: kSignUpText2, style: TextStyle(fontSize: 14)),
                    TextSpan(
                      text: kSignUpText3,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    )
                  ], style: TextStyle(color: Colors.black)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
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
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.fingerprint),
                              labelText: kSignUpText8,
                              hintText: kSignUpText8,
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.remove_red_eye))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
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
                      child: Text(kSignUpText9,
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
                        child: Text(kSignUpText10),
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
                            kSignUpText11,
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
                            kSignUpText12,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
