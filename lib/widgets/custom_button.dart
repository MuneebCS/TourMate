import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double c_height;
  final double c_width;
  final Color col;
  final VoidCallback onPress;
  final Widget child;

  CustomButton({
    required this.col,
    required this.c_height,
    required this.c_width,
    required this.onPress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: c_height,
        width: c_width,
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
