import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

schoolStyle(String data) {
  return Text(
    data,
    style: GoogleFonts.schoolbell(
        textStyle: const TextStyle(
            color: Colors.black,
            letterSpacing: .5,
            decoration: TextDecoration.none)),
  );
}
