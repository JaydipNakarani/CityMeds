import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeHeaderContent extends StatelessWidget {
  const HomeHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
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
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Citymeds", style: AppTextStyles.white12400),
          SizedBox(height: 02),

          Text("15 minutes delivery", style: AppTextStyles.white18700),
          SizedBox(height: 02),

          Row(
            children: [
              Image.asset(Images.location, height: 12, width: 12),
              SizedBox(width: 04),
              Expanded(
                child: Text(
                  "1st Floor Punjabi Bagh",
                  style: AppTextStyles.white12500,
                ),
              ),

              Image.asset(Images.notification, height: 20, width: 20),
            ],
          ),
          SizedBox(height: 02),
        ],
      ),
    );
  }
}
