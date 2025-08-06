import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class ToNextPageButton extends StatelessWidget {
  const ToNextPageButton({
    super.key,
    required this.title,
    this.buttonBackgroundColor,
    this.buttonTextStyle,
  });

  final String title;
  final Color? buttonBackgroundColor;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: buttonBackgroundColor ?? AppColors.redPinkFD5D69,
        fixedSize: Size(162.w, 45.h),
      ),
      child: Text(title, style: buttonTextStyle ?? Styles.s20w600whiteFFFDF9),
    );
  }
}
