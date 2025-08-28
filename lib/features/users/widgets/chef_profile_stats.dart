import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';

class ChefProfileStats extends StatelessWidget {
  const ChefProfileStats({
    super.key,
    required this.model,
  });

  final ChefModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${model.recipesCount}',
                  style: Styles.s15w500whiteBeigeFFFDF9.copyWith(height: 1.h),
                ),
                Text(
                  'recipes',
                  style: Styles.s12w400whiteFFFDF9.copyWith(height: 1.h),
                ),
              ],
            ),
            SizedBox(
              height: 26.h,
              child: VerticalDivider(color: AppColors.pinkFFC6C9),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${model.followingCount}',
                  style: Styles.s15w500whiteBeigeFFFDF9.copyWith(height: 1.h),
                ),
                Text(
                  'Following',
                  style: Styles.s12w400whiteFFFDF9.copyWith(height: 1.h),
                ),
              ],
            ),
            SizedBox(
              height: 26.h,
              child: VerticalDivider(color: AppColors.pinkFFC6C9),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${model.followerCount}',
                  style: Styles.s15w500whiteBeigeFFFDF9.copyWith(height: 1.h),
                ),
                Text(
                  'Followers',
                  style: Styles.s12w400whiteFFFDF9.copyWith(height: 1.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
