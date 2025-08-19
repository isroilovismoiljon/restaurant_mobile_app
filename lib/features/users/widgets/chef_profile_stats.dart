import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';
import '../../common/others/animated_border_container.dart';

class ChefProfileStats extends StatelessWidget {
  const ChefProfileStats({
    super.key, required this.model,
  });

  final ChefModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: Styles.s15w500whiteBeigeFFFDF9.copyWith(height: 1),
              ),
              Text(
                'recipes',
                style: Styles.s12w400whiteFFFDF9.copyWith(height: 1),
              ),
            ],
          ),
          SizedBox(
              height: 26.h,
              child: VerticalDivider(color: AppColors.pinkFFC6C9)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${model.followingCount}',
                style: Styles.s15w500whiteBeigeFFFDF9.copyWith(height: 1),
              ),
              Text(
                'Following',
                style: Styles.s12w400whiteFFFDF9.copyWith(height: 1),
              ),
            ],
          ),
          SizedBox(
              height: 26.h,
              child: VerticalDivider(color: AppColors.pinkFFC6C9)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${model.followerCount}',
                style: Styles.s15w500whiteBeigeFFFDF9.copyWith(height: 1),
              ),
              Text(
                'Followers',
                style: Styles.s12w400whiteFFFDF9.copyWith(height: 1),
              ),
            ],
          ),
        ],
      ),
    )
    ;
  }
}
