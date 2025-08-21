import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black333333,
  );
  static const TextStyle black14600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black333333,
  );
  static const TextStyle grey12_500underline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grey878B91,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dotted,
  );

  static const TextStyle white12400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static const TextStyle white18700 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static const TextStyle white12500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}
