import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class CreateReviewButton extends StatelessWidget {
  const CreateReviewButton({
    super.key, required this.title, this.backgroundColor = AppColors.pinkFFC6C9, this.textStyle = Styles.s15w500pinkEC888D, required this.onPressed,
  });

  final String title;
  final Color backgroundColor;
  final TextStyle textStyle;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle,
      ),
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 3.h),
        backgroundColor: backgroundColor,
        minimumSize: Size.zero,
      ),
    );
  }
}
