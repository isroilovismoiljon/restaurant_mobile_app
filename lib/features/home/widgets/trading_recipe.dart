import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

import '../../common/like/like.dart';

class TradingRecipe extends StatefulWidget {
  const TradingRecipe({
    super.key,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    this.colorContainer = Colors.transparent,
    this.colorTitle = AppColors.whiteBeigeFFFDF9,
    this.colorDescription = AppColors.whiteBeigeFFFDF9,
  });

  final String title;
  final String description;
  final String photo;
  final int timeRequired;
  final num rating;
  final Color colorContainer;
  final Color colorTitle;
  final Color colorDescription;

  @override
  State<TradingRecipe> createState() => _TradingRecipeState();
}

class _TradingRecipeState extends State<TradingRecipe> {
  bool isTapLike = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.fromLTRB(15.w, 9.h, 15.w, 2.h),
            alignment: Alignment.topLeft,
            width: 348.w,
            height: 49.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(14.r),
                ),
                border: Border.all(
                  color: AppColors.pinkColorEC888D,
                ),
                color: widget.colorContainer
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 260.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                    color: widget.colorTitle,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          color: widget.colorDescription,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                        ).copyWith(height: 1.h),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      spacing: 6.w,
                      children: [
                        SvgPicture.asset(
                          AppIcons.clock,
                          width: 9.7.w,
                          height: 10.h,
                        ),
                        Text(
                          "${widget.timeRequired}min",
                          style: Styles.s12w400pinkColorEC888D,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5.w,
                      children: [
                        Text(
                          "${widget.rating}",
                          style: Styles.s12w400pinkColorEC888D.copyWith(height: 1.h),
                        ),
                        SvgPicture.asset(
                          AppIcons.star,
                          width: 10.w,
                          height: 10.h,
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
            borderRadius: BorderRadiusGeometry.circular(14.r),
            child: Image.network(
              widget.photo,
              width: 358.w,
              height: 143.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 7.h, right: 8.52.w),
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
          ),
        ),
      ],
    )
    ;
  }
}

