import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/models/cart_item_model.dart';
import 'package:citymeds/models/recommended_product.dart';
import 'package:citymeds/screens/checkout/widgets/cart_item_tile.dart';
import 'package:citymeds/screens/home/widgets/section_header.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:citymeds/widgets/custom_appbar.dart';
import 'package:citymeds/widgets/custom_image.dart';
import 'package:citymeds/widgets/dotted_line.dart';
import 'package:flutter/material.dart';

import 'widgets/place_order_button.dart';
import 'widgets/recommended_product_tile.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CartItem> cartItems = [
    CartItem(
      name: "Paracetamol Capuse",
      subtitle: "1 Packet 20 Tablets",
      imageUrl: Images.paracetamol,
      quantity: 1,
      price: 120,
    ),
    CartItem(
      name: "Dextromethorphan",
      subtitle: "1 Bottle",
      imageUrl: Images.dextro,
      quantity: 1,
      price: 150,
    ),
    CartItem(
      name: "Bornvita Chocolate Drink",
      subtitle: "1 kg",
      imageUrl: Images.vita,
      quantity: 1,
      price: 500,
    ),
    CartItem(
      name: "Vicks VapoRub Balm",
      subtitle: "50 ml",
      imageUrl: Images.vicks,
      quantity: 2,
      price: 132,
    ),
    CartItem(
      name: "Vicks VapoRub Balm",
      subtitle: "50 ml",
      imageUrl: Images.vicks,
      quantity: 2,
      price: 132,
    ),
  ];
  double get originalTotal => cartItems.fold(
    0,
    (sum, item) => sum + (item.price * item.quantity * 1.2),
  ); // assuming 20% discount
  double get discountedTotal =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get deliveryCharge => 0; // Free
  double get handlingCharge => 9;
  double get grandTotal => discountedTotal + handlingCharge;
  double get totalSavings => originalTotal - discountedTotal;

  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        height: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(Icons.arrow_back_ios_new),
              ),
              color: Colors.white,
            ),
            Text(
              "CheckOut ",
              style: AppTextStyles.white18700.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Delivery Info Container
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.darkPrimary, width: 0.6),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_filled_sharp,
                          color: Colors.green,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Free delivery in 18 minutes",
                          style: AppTextStyles.black14600.copyWith(
                            color: AppColors.darkPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CartItemTile(
                                item: cartItems[index],
                                onIncrease: () {
                                  setState(() {
                                    cartItems[index].quantity++;
                                  });
                                },
                                onDecrease: () {
                                  setState(() {
                                    if (cartItems[index].quantity > 1) {
                                      cartItems[index].quantity--;
                                    }
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildPriceDetailsSection(),
            const SizedBox(height: 12),
            _buildRecommendedProductsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomDeliveryAndPaymentBar(),
    );
  }

  Widget _buildPriceDetailsSection() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Price Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),

            if (_expanded) ...[
              SizedBox(height: 08),
              const DottedLine(),
              SizedBox(height: 08),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price (${cartItems.length} items)",
                    style: AppTextStyles.grey12_500underline,
                  ),
                  Row(
                    children: [
                      Text(
                        "₹${originalTotal.toStringAsFixed(0)}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "₹${discountedTotal.toStringAsFixed(1)}",
                        style: AppTextStyles.black14600,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Charge",
                    style: AppTextStyles.grey12_500underline,
                  ),
                  Row(
                    children: [
                      const Text(
                        "₹30",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "FREE",
                        style: TextStyle(
                          color: AppColors.darkPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Handling Charge",
                    style: AppTextStyles.grey12_500underline,
                  ),
                  Text("₹${handlingCharge.toStringAsFixed(0)}"),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Grand Total", style: AppTextStyles.body),
                  Text(
                    "₹${grandTotal.toStringAsFixed(1)}",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "You will save ₹${totalSavings.toStringAsFixed(0)} on this order",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedProductsSection() {
    List<RecommendedProduct> recommendedProducts = [
      RecommendedProduct(
        name: "Vicks Value Pack...",
        imageUrl: Images.vapor, // Replace with actual image path
        price: 280,
        quantity: "150 ml",
      ),
      RecommendedProduct(
        name: "Vicks Value Pack...",
        imageUrl: Images.vapor, // Replace with actual image path
        price: 280,
        quantity: "150 ml",
      ),
      RecommendedProduct(
        name: "Vicks Value Pack...",
        imageUrl: Images.vapor, // Replace with actual image path
        price: 280,
        quantity: "150 ml",
      ),
      RecommendedProduct(
        name: "Vicco Turmeric Cream",
        imageUrl: Images.vapor, // Replace with actual image path
        price: 120,
        quantity: "50 g",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "You might also like", seeAllText: "See All"),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendedProducts.length,
            itemBuilder: (context, index) {
              return RecommendedProductTile(
                product: recommendedProducts[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomDeliveryAndPaymentBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Delivery Address Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomImage(
                            imagePath: Images.delHome,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 05),
                          Text(
                            "Delivering to Home",
                            style: AppTextStyles.black14600,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "1st Floor Punjabi Bagh, phase 2 above HDFC bank",
                        style: AppTextStyles.black14600.copyWith(
                          fontSize: 12,
                          color: Color(0xff857979),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle address change
                },
                child: Text("Change", style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
          const SizedBox(height: 5),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImage(
                        imagePath: Images.paytm,
                        height: 20,
                        width: 40,
                      ),
                      const SizedBox(width: 8),
                      Text("Pay using", style: AppTextStyles.black14600),
                      Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                  Text("Paytm UPI", style: AppTextStyles.black14600),
                ],
              ),

              PlaceOrderButton(totalPrice: "₹${grandTotal.toStringAsFixed(1)}"),
            ],
          ),
        ],
      ),
    );
  }
}
