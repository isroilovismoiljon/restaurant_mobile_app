import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

import '../../common/like/like.dart';

class YourRecipeWidget extends StatefulWidget {
  const YourRecipeWidget({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.timeRequired,
  });

  final String image;
  final String title;
  final num rating;
  final int timeRequired;

  @override
  State<YourRecipeWidget> createState() => _YourRecipeWidgetState();
}

class _YourRecipeWidgetState extends State<YourRecipeWidget> {
  bool isTapLike = false;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.w,
      height: 195.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(13.r),
              child: Image.network(
                widget.image,
                width: 168.w,
                height: 162.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                color: AppColors.whiteBeigeFFFDF9,
              ),
              width: 168.w,
              height: 48.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                  horizontal: 15.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: Styles.s12w400black1C0F0D,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      spacing: 26.w,
                      children: [
                        Row(
                          spacing: 4.w,
                          children: [
                            Text(
                              '${widget.rating}',
                              style: Styles.s12w400pinkColorEC888D,
                            ),
                            SvgPicture.asset(AppIcons.star),
                          ],
                        ),
                        Row(
                          spacing: 6.w,
                          children: [
                            SvgPicture.asset(AppIcons.clock),
                            Text(
                              '${widget.timeRequired}min',
                              style: Styles.s12w400pinkColorEC888D,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
      ),
    );
  }
}
