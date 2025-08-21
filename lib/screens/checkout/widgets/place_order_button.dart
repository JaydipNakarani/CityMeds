import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PlaceOrderButton extends StatelessWidget {
  final String totalPrice;
  const PlaceOrderButton({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.darkPrimary,
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total", style: AppTextStyles.white12400.copyWith(fontSize: 12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                totalPrice.toString(),
                style: AppTextStyles.white12400.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Place Order",
                style: AppTextStyles.white12500.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
