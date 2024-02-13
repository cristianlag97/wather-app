import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,

        //Text
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates(
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
          titleMedium: GoogleFonts.montserratAlternates(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          titleSmall: GoogleFonts.montserratAlternates(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          bodyLarge: GoogleFonts.montserratAlternates(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: GoogleFonts.montserratAlternates(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: GoogleFonts.montserratAlternates(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
