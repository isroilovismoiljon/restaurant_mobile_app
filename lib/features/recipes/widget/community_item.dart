import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/time/time_helper.dart';
import '../../../data/models/recipes/community_model.dart';

class CommunityItem extends StatelessWidget {
  const CommunityItem({
    super.key,
    required this.community,
  });

  final CommunityModel community;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        Row(
          spacing: 14.w,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(17.r),
              child: Image.network(
                community.user.profilePhoto,
                width: 35.w,
                height: 35.h,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@${community.user.username}',
                  style: Styles.s15w400whiteBeigeFFFDF9poppins,
                ),
                Text(
                  '${TimeHelper.timeAgo(community.created.toString())}',
                  style: Styles.s12w400pinkColorEC888D,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 251.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  height: 78.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(14.r)),
                    color: AppColors.redPinkFD5D69,
                  ),
                  child: Column(
                    children: [
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 275.w),
                            child: Text(
                              community.title,
                              style: Styles.s15w500whiteBeigeFFFDF9,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            spacing: 5.w,
                            children: [
                              SvgPicture.asset(AppIcons.starFilled),
                              Text(
                                '${community.rating}',
                                style: Styles.s12w400whiteFFFDF9,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 258.w,
                            child: Text(
                              community.description,
                              style: Styles.s14w300whiteFFFDF9.copyWith(height: 1.2.h),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                spacing: 5.w,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.clock,
                                    colorFilter: ColorFilter.mode(AppColors.whiteBeigeFFFDF9, BlendMode.srcIn),
                                  ),
                                  Text('${community.timeRequired} min', style: Styles.s12w400whiteFFFDF9,)
                                ],
                              ),
                              Row(
                                spacing: 5.w,
                                children: [
                                  Text('${community.reviewsCount}', style: Styles.s12w400whiteFFFDF9,),
                                  SvgPicture.asset(
                                    AppIcons.community,
                                    colorFilter: ColorFilter.mode(AppColors.whiteBeigeFFFDF9, BlendMode.srcIn),
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
                  child: Image.network(
                    community.photo,
                    fit: BoxFit.cover,
                    height: 173.h,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
