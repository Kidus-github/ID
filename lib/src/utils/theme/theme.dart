import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
