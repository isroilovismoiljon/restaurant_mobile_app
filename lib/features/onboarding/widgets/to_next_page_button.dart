import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class ToNextPageButton extends StatelessWidget {
  const ToNextPageButton({
    super.key,
    required this.title,
    this.buttonBackgroundColor,
    this.buttonTextStyle,
    required this.onPressed,
  });

  final String title;
  final Color? buttonBackgroundColor;
  final TextStyle? buttonTextStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: buttonBackgroundColor ?? AppColors.redPinkFD5D69,
        fixedSize: Size(162.w, 45.h),
      ),
      child: Text(title, style: buttonTextStyle ?? AppStyles.s20w600whiteFFFDF9),
    );
  }
}
