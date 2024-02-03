import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.interTextTheme(),
      );
}
