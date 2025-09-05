import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class AddButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AddButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(Icons.add, color: AppColors.black),
      label: Text(label, style: AppStyles.s15w500black),
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: Size(211.w, 35.h),
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        backgroundColor: AppColors.redPinkFD5D69,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      ),
    );
  }
}
