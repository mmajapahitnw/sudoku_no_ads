import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  // appBarTheme: ColorScheme.fromSwatch(backgroundColor: Color.fromRGBO(227, 228, 237, 1)),
  scaffoldBackgroundColor: Color.fromRGBO(227, 228, 237, 1),
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: Color.fromRGBO(227, 228, 237, 1),
  ),
  // brightness: Brightness.dark,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.deepOrange,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.deepPurple,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 20,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 9,
      color: Colors.black45
    )
  )
);