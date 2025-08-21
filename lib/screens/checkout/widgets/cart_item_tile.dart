import 'package:citymeds/models/cart_item_model.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.imageUrl,
              width: 67,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "| ${item.subtitle}",
                  style: const TextStyle(
                    color: Color(0xff695A5A),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Move to wishlist",
                  style: TextStyle(
                    color: Color(0xff695A5A),
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dotted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // width: 55,
            // height: 22,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 05),
            decoration: BoxDecoration(
              color: Color(0xff18A06B),
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(-2, 1),
                  color: Color(0xff131313).withValues(alpha: 0.14),
                ),
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, -2),
                  color: Colors.white.withValues(alpha: 0.25),
                ),
              ],
            ),
            child: Row(
              spacing: 2,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onDecrease,
                  child: const Icon(
                    Icons.remove,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 05),
                Text(
                  "${item.quantity}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 05),
                GestureDetector(
                  onTap: onIncrease,
                  child: Icon(Icons.add, size: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
