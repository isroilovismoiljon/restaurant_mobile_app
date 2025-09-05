import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class AddRecipeCustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  AddRecipeCustomTextField({
    super.key,
    required this.hint,
    required this.controller, this.maxHeightField = 41,
  });

  final int maxHeightField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 15.w),
          constraints: BoxConstraints(maxHeight: maxHeightField.h),
          hintText: hint,
          hintStyle: AppStyles.s15w500beige1C0F0D_opacity45,
          filled: true,
          fillColor: AppColors.pinkFFC6C9,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
      ),
    );
  }
}
