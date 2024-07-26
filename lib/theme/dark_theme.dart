import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData DarkTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF133136),
  secondaryHeaderColor: const Color(0xFFE1A25A),
  cardColor: const Color(0xFF164449),
  hintColor: const Color(0xFFB5A696),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.montserrat(
      color: const Color(0xFFF9EAD9),
    ),
    displayMedium: GoogleFonts.montserrat(
      color: const Color(0xFF626C65),
    ),
  ),
);
