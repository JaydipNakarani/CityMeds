import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/models/store_model.dart';
import 'package:citymeds/screens/checkout/checkout_page.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;

  const StoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.25),
            blurRadius: 4.2,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 10),
            child: Row(
              spacing: 2,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(store.logoUrl),
                ),
                SizedBox(width: 05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text(store.name, style: AppTextStyles.black14600),
                      Text(
                        store.location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.favorite_border, color: Colors.grey),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CheckoutPage();
                              },
                            ),
                          );
                        },
                        child: Image.asset(Images.addCart, height: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 05),
              ],
            ),
          ),

          // Container for Availability Options
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 04),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Availability
                _buildAttribute(
                  store.isAvailable ? "Available" : "Not Available",
                  store.isAvailable
                      ? AppColors.black004E4C
                      : AppColors.redF83D3D,
                ),
                // Experience
                _buildAttribute(store.experience, AppColors.black004E4C),
                // Medicines Count
                _buildAttribute(store.medicinesCount, AppColors.black004E4C),

                // Add to Cart Button
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttribute(String text, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.4,
          backgroundColor: color == AppColors.redF83D3D
              ? AppColors.redF83D3D
              : AppColors.black004E4C,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color == AppColors.redF83D3D
                ? AppColors.redF83D3D
                : AppColors.black004E4C,
          ),
        ),
      ],
    );
  }
}
