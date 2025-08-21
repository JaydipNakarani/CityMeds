import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.onTap,
    this.margin,
    this.fit,
  });
  final String imagePath;
  final double height;
  final double width;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
      ),
    );
  }
}
