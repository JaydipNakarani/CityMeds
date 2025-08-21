import 'package:citymeds/models/recommended_product.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class RecommendedProductTile extends StatelessWidget {
  final RecommendedProduct product;

  const RecommendedProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    // width: 50,
                    // height: 60,
                  ),
                ),
              ),
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name, // Use the product's name
                    style: AppTextStyles.black14600.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "MRP ₹${product.price}", // Use the product's price
                        style: AppTextStyles.black14600.copyWith(
                          fontSize: 12,
                          color: AppColors.darkPrimary,
                        ),
                      ),
                      Text(
                        product.quantity, // Use the product's quantity
                        style: AppTextStyles.black14600.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
