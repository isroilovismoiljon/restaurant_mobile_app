import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';

class BottomNavigationBarGradient extends StatelessWidget {
  const BottomNavigationBarGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.backgroundBeigeGradient1C0F0D, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          // transform: GradientRotation(3.14 / 2),
        ),
      ),
    );
  }
}
