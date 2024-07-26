import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double C_height;
  final double C_width;
  final Color Col;
  final VoidCallback onPress;
  final Widget child;

  CustomButton({
    required this.Col,
    required this.C_height,
    required this.C_width,
    required this.onPress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: C_height,
        width: C_width,
        decoration: BoxDecoration(
          color: Col,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
