import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

montStyle(String data) {
  return Text(
    data,
    style: GoogleFonts.montserrat(
        textStyle: const TextStyle(
            color: Colors.black,
            letterSpacing: .5,
            decoration: TextDecoration.none)),
  );
}
