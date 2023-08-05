import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const TextStyleWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color = Colors.black, // Set the default color to black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: AutoSizeText(
        text,
        style: GoogleFonts.acme(
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
