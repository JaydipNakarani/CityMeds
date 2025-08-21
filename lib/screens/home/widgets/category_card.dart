import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.asset(
          category,
          fit: BoxFit.cover,
          height: MediaQuery.sizeOf(context).width / 3 - 17,
          width: MediaQuery.sizeOf(context).width / 3 - 17,
        ),
      ),
    );
  }
}
