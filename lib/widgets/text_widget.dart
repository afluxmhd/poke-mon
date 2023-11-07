import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.label, this.fontWeight = FontWeight.w500, this.fontSize = 15});

  final String label;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ));
  }
}
