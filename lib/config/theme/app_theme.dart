import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,

        //Text
        textTheme: TextTheme(
          titleLarge: GoogleFonts.mulish(
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
          titleMedium: GoogleFonts.mulish(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          titleSmall: GoogleFonts.mulish(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          bodyLarge: GoogleFonts.mulish(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: GoogleFonts.mulish(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
