import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final double width;
  final IconData? leadingIcon;
  final Widget? trailingWidget;
  final String? hintText;
  final bool obscureText;

  const CustomTextField({
    required this.height,
    required this.width,
    this.leadingIcon,
    this.trailingWidget,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextField(
        obscureText: obscureText,
        cursorColor: Theme.of(context).hintColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(fontSize: 12),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          isDense: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hintColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).hintColor),
          ),
          prefixIcon: leadingIcon != null
              ? Icon(
                  leadingIcon,
                  color: Theme.of(context).secondaryHeaderColor,
                )
              : null,
          suffixIcon: trailingWidget,
        ),
      ),
    );
  }
}
