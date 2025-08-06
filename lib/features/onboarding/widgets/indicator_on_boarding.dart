import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';

class IndicatorOnBoarding extends StatelessWidget {
  const IndicatorOnBoarding({super.key, required this.alignment});
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: 230.w,
      height: 12.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.whiteD9D9D9,
      ),
      child: Container(
        width: 65.w,
        height: 12.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.redPinkFD5D69,
        ),
      ),
    );
  }
}
