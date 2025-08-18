import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/users/managers/chef_profile_vm.dart';

class ChefProfileStats extends StatelessWidget {
  const ChefProfileStats({
    super.key, required this.model,
  });

  final ChefModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 20,
      ),
      width: double.infinity,
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: BoxBorder.all(color: AppColors.pinkFFC6C9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '${model.recipesCount}',
                style: Styles.s15w500whiteBeigeFFFDF9,
              ),
              Text(
                'recipes',
                style: Styles.s12w400whiteFFFDF9,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: VerticalDivider(
              color: AppColors.pinkFFC6C9,
            ),
          ),
          Column(
            children: [
              Text(
                '${model.followingCount}',
                style: Styles.s15w500whiteBeigeFFFDF9,
              ),
              Text(
                'Following',
                style: Styles.s12w400whiteFFFDF9,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: VerticalDivider(
              color: AppColors.pinkFFC6C9,
            ),
          ),
          Column(
            children: [
              Text(
                '${model.followerCount}',
                style: Styles.s15w500whiteBeigeFFFDF9,
              ),
              Text(
                'Followers',
                style: Styles.s12w400whiteFFFDF9,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
