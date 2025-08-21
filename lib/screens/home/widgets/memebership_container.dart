import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:citymeds/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: EdgeInsets.only(left: 14, top: 14, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xffFFE59C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Take Membership", style: AppTextStyles.headline2),
                    SizedBox(height: 8),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "⚫",
                          style: AppTextStyles.black14600.copyWith(
                            fontSize: 12,
                            color: Color(0xff433E3E),
                          ),
                        ),
                        SizedBox(width: 05),
                        Expanded(
                          child: Text(
                            "Get Special discounts and offers on Citymeds services.",
                            style: AppTextStyles.black14600.copyWith(
                              fontSize: 12,
                              color: Color(0xff433E3E),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "⚫",
                          style: AppTextStyles.black14600.copyWith(
                            fontSize: 12,
                            color: Color(0xff433E3E),
                          ),
                        ),
                        SizedBox(width: 05),
                        Expanded(
                          child: Text(
                            "Get 5% NMS Cash on all orders.",
                            style: AppTextStyles.black14600.copyWith(
                              fontSize: 12,
                              color: Color(0xff433E3E),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyButton(text: "Explore Plans", onPressed: () {}),
                  ],
                ),
              ),

              SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPaint(
                        painter: ShadowPainter(),
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: Image.asset(
                              Images.membership,
                              width: 90,
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xff31b682)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.flash_on,
                              size: 12,
                              color: AppColors.darkPrimary,
                            ),
                            SizedBox(width: 05),
                            Text(
                              "Starting at Rs.99",
                              style: AppTextStyles.white18700.copyWith(
                                color: AppColors.darkPrimary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    // Draw shadow as a circle behind
    final Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2.2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
