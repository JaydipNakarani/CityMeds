import 'package:flutter/material.dart';

class PriceDetails extends StatelessWidget {
  final double totalPrice;
  final double discountPrice;
  final double handlingCharge;
  final double deliveryCharge;

  const PriceDetails({
    super.key,
    required this.totalPrice,
    required this.discountPrice,
    required this.handlingCharge,
    required this.deliveryCharge,
  });

  @override
  Widget build(BuildContext context) {
    final grandTotal =
        totalPrice - discountPrice + handlingCharge + deliveryCharge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Price Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 6),
        _priceRow("Price", "₹$totalPrice"),
        _priceRow("Discount", "-₹$discountPrice", free: true),
        _priceRow(
          "Delivery Charge",
          deliveryCharge == 0 ? "FREE" : "₹$deliveryCharge",
          free: deliveryCharge == 0,
        ),
        _priceRow("Handling Charge", "₹$handlingCharge"),
        const Divider(),
        _priceRow("Grand Total", "₹$grandTotal", bold: true),
      ],
    );
  }

  Widget _priceRow(
    String label,
    String value, {
    bool free = false,
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: free ? Colors.green : Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
