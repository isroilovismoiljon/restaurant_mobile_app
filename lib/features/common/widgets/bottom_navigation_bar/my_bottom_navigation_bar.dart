import 'package:flutter/material.dart';
import 'bottom_navigation_bar_gradient.dart';
import 'bottom_navigation_bar_items.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [BottomNavigationBarGradient(), BottomNavigationBarItems()],
    );
  }
}
