import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final Color backgroundColor;
  final double borderRadius;

  const CustomAppBar({
    super.key,
    required this.child,
    this.height = 135,
    this.backgroundColor = AppColors.secondary,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, -3),
            color: AppColors.white.withValues(alpha: 0.25),
          ),
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1),
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
