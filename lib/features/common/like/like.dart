import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';

class Like extends StatelessWidget {
  const Like({
    super.key,
    required this.isTapLike,
  });

  final bool isTapLike;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      width: 28.w,
      height: 28.h,
      decoration: BoxDecoration(
        color: isTapLike ? AppColors.redPinkFD5D69 : AppColors.pinkFFC6C9,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: SvgPicture.asset(
        AppIcons.like,
        color: isTapLike ? null : AppColors.pinkColorEC888D,
      ),
    );
  }
}
