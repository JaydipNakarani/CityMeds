import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/screens/home/home_page.dart';
import 'package:citymeds/theme/app_colors.dart' show AppColors;
import 'package:citymeds/theme/app_text_styles.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(icon: Icons.home, label: "Home"),
    _NavItem(icon: Icons.shopping_bag, label: "Store"),
    _NavItem(icon: Icons.discount_outlined, label: "Deals"),
    _NavItem(icon: Icons.shopping_cart, label: "Cart"),
    _NavItem(icon: Icons.person_outline_outlined, label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.secondary,
        buttonBackgroundColor: AppColors.primary,
        backgroundColor: Colors.transparent,
        iconPadding: 15,
        height: 70,
        index: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          CurvedNavigationBarItem(
            child: Padding(
              padding: EdgeInsets.only(top: _selectedIndex != 0 ? 12.0 : 0),
              child: Image.asset(
                Images.home,
                color: _selectedIndex == 0
                    ? AppColors.secondary
                    : AppColors.darkPrimary,
                height: 30,
              ),
            ),
            label: _selectedIndex == 0 ? 'Home' : '',
            labelStyle: AppTextStyles.white12400,
          ),
          CurvedNavigationBarItem(
            child: Padding(
              padding: EdgeInsets.only(top: _selectedIndex != 1 ? 12.0 : 0),
              child: Image.asset(
                Images.shopping,
                color: _selectedIndex == 1
                    ? AppColors.secondary
                    : AppColors.darkPrimary,
                height: 30,
              ),
            ),
            label: _selectedIndex == 1 ? 'Store' : '',
            labelStyle: AppTextStyles.white12400,
          ),
          CurvedNavigationBarItem(
            child: Padding(
              padding: EdgeInsets.only(top: _selectedIndex != 2 ? 12.0 : 0),
              child: Image.asset(
                Images.discount,
                color: _selectedIndex == 2
                    ? AppColors.secondary
                    : AppColors.darkPrimary,
                height: 30,
              ),
            ),
            label: _selectedIndex == 2 ? 'Deals' : "",
            labelStyle: AppTextStyles.white12400,
          ),
          CurvedNavigationBarItem(
            child: Padding(
              padding: EdgeInsets.only(top: _selectedIndex != 3 ? 12.0 : 0),
              child: Image.asset(
                Images.research,
                color: _selectedIndex == 3
                    ? AppColors.secondary
                    : AppColors.darkPrimary,
                height: 30,
              ),
            ),
            label: _selectedIndex == 3 ? 'Research' : "",
            labelStyle: AppTextStyles.white12400,
          ),
          CurvedNavigationBarItem(
            child: Padding(
              padding: EdgeInsets.only(top: _selectedIndex != 4 ? 12.0 : 0),
              child: Image.asset(
                Images.profile,
                color: _selectedIndex == 4
                    ? AppColors.secondary
                    : AppColors.darkPrimary,
                height: 30,
              ),
            ),
            label: _selectedIndex == 4 ? 'Profile' : "",
            labelStyle: AppTextStyles.white12400,
          ),
        ],
      ),
    );
    // (
    // index: _selectedIndex,
    // height: 60,
    // backgroundColor: Colors.transparent,
    // color: AppColors.secondary,
    // buttonBackgroundColor: AppColors.darkPrimary,
    // animationDuration: const Duration(milliseconds: 600),
    // iconPadding: 10,
    // items: List.generate(_navItems.length, (index) {
    //   final item = _navItems[index];
    //   final isSelected = _selectedIndex == index;
    //
    //   return CurvedNavigationBarItem(
    //     child: Center(
    //       child: Icon(
    //         item.icon,
    //         color: isSelected ? AppColors.secondary : AppColors.darkPrimary,
    //         size: 26,
    //       ),
    //     ),
    //     label: isSelected ? item.label : "",
    //     labelStyle: AppTextStyles.white_12_500.copyWith(fontSize: 14),
    //   );
    // }),
    // onTap: (index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // },
    // ),
    // );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Coming Soon")));
  }
}
