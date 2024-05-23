import 'package:flutter/material.dart';
import '../../core/style/color_app.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextRobotoField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validate;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  const CustomTextRobotoField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validate,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: validate,
          obscureText: obscureText ?? false,
          controller: controller,
          decoration: InputDecoration(
            
            contentPadding: EdgeInsets.all(10),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.grey100),
                borderRadius: BorderRadius.circular(4)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.grey100),
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ],
    );
  }
}
