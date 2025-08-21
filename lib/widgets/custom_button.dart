import 'package:citymeds/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final double borderRadius;
  final double? textSize;

  const MyButton({
    super.key,
    this.width,
    this.height = 34,
    required this.text,
    this.buttonColor,
    this.textColor,
    required this.onPressed,
    this.borderRadius = 6,
    this.textSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(-2, 1),
            color: Color(0xff131313).withValues(alpha: 0.14),
          ),
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, -2),
            color: Colors.white.withValues(alpha: 0.25),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              buttonColor ?? AppColors.darkPrimary, // Default color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white, // Default text color
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
