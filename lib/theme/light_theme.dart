import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData LightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFE8C8),
  secondaryHeaderColor: const Color(0xFFE1A25A),
  hintColor: const Color(0xFF164449),
  cardColor: const Color(0xFFB5A696),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.montserrat(
      color: const Color(0xFF164449),
    ),
    displayMedium: GoogleFonts.montserrat(
      color: const Color(0xFFF9EAD9),
    ),
  ),
);
