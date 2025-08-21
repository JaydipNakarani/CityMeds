import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? seeAllText;
  final VoidCallback? onSeeAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.seeAllText,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.black14600.copyWith(fontSize: 18)),
          if (seeAllText != null)
            InkWell(
              onTap: onSeeAllPressed,
              child: Text(
                seeAllText!,
                style: AppTextStyles.white12400.copyWith(
                  color: AppColors.darkPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
