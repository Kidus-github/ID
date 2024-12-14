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
      headlineMedium: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      headlineSmall: const TextStyle(color: Colors.black, fontSize: 8),
    ),
  );
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
