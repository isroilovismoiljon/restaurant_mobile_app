import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';

class AddRecipeImage extends StatelessWidget {
  const AddRecipeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
            height: 281,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.redPinkFD5D69,
            child: SvgPicture.asset(
              AppIcons.play,
              width: 30.w,
              height: 40.h,
              colorFilter: ColorFilter.mode(AppColors.whiteBeigeFFFDF9, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
