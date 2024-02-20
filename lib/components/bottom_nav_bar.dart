import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        activeColor: Colors.white,
        color: Colors.grey,
        mainAxisAlignment: MainAxisAlignment.center,
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 8,
        tabs: const [
          // shop tab
          GButton(
            icon: Icons.home,
            text: "SHOP",
          ),

          // cart tab
          GButton(
            icon: Icons.shopping_bag,
            text: "CART",
          ),
        ],
      ),
    );
  }
}
