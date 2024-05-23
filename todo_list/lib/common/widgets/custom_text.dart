import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextNunito extends StatelessWidget {
  const CustomTextNunito(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      this.textAlign});
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        maxLines: 2,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: color,overflow: TextOverflow.ellipsis),
        ));
  }
}
