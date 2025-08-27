import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/like/like.dart';
import 'package:restourant_mobile_app/features/common/time/time_helper.dart';
import '../../../core/routing/routes.dart';
import '../../../data/models/recipes/community_model.dart';
class CommunityItemRecipe extends StatefulWidget {
  const CommunityItemRecipe({
    super.key,
    required this.community,
  });

  final CommunityModel community;

  @override
  State<CommunityItemRecipe> createState() => _CommunityItemRecipeState();
}

class _CommunityItemRecipeState extends State<CommunityItemRecipe> {
  bool isTapLike = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          Routers.recipesPage,
          extra: {'recipeId': widget.community.id, 'recipeTitle': widget.community.title},
        );
      },
      child: SizedBox(
        height: 251.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 2.h),
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
                            widget.community.title,
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
                              '${widget.community.rating}',
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
                            widget.community.description,
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
                                Text('${widget.community.timeRequired} min', style: Styles.s12w400whiteFFFDF9,)
                              ],
                            ),
                            Row(
                              spacing: 5.w,
                              children: [
                                Text('${widget.community.reviewsCount}', style: Styles.s12w400whiteFFFDF9,),
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
                  widget.community.photo,
                  fit: BoxFit.cover,
                  height: 173.h,
                  width: double.infinity,
                ),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 11.h, right: 11.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTapLike = !isTapLike;
                      });
                    },
                    child: Like(
                      isTapLike: isTapLike,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}