import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:citymeds/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Container(
        height: 40, // Fixed height for the search bar
        padding: const EdgeInsets.symmetric(horizontal: 16),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, -1),
              color: AppColors.white.withValues(alpha: 0.25),
            ),
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(1, 0),
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(imagePath: Images.searchIcon, height: 16, width: 16),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Store & Health Products',
                  border: InputBorder.none,
                  hintStyle: AppTextStyles.white12500.copyWith(
                    color: AppColors.grey465055,
                  ),
                  contentPadding: EdgeInsets.only(bottom: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
