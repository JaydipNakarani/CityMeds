import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReferAndEarnContainer extends StatelessWidget {
  const ReferAndEarnContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.25),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Color(0xff654747).withValues(alpha: 0.25),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Text content
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "REFER & EARN",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Invite friends and family to earn cashback on citymeds",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),

                SizedBox(height: 10),
                Image.asset(Images.invite, height: 35),
              ],
            ),
          ),
          // Image content
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 65,
                backgroundColor: AppColors.primary.withOpacity(0.2),
                child: Image.asset(
                  Images.referEarn, // Replace with your image path
                  fit: BoxFit.cover,
                  height: 110,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
