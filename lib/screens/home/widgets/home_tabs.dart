import 'package:citymeds/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTabs extends StatefulWidget {
  final List<String> tabs;
  const HomeTabs({super.key, required this.tabs});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,

      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 0.7,
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.borderB9BBBD,
                ),
              ),
              child: Text(
                widget.tabs[index],
                style: TextStyle(
                  color: isSelected
                      ? AppColors.darkPrimary
                      : AppColors.grey465055,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: widget.tabs.length,
      ),
    );
  }
}
