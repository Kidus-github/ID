import 'package:flutter/material.dart';
import 'package:id/src/constants/colors.dart';

class TextFieldTheme {
  TextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: kDarkColor,
          floatingLabelStyle: TextStyle(color: kDarkColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kDarkColor)));

  static InputDecorationTheme DarkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: kLightColor,
          floatingLabelStyle: TextStyle(color: kLightColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: kLightColor)));
}
