import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

import '../../common/like.dart';

class RecentlyAddedItem extends StatefulWidget {
  const RecentlyAddedItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.timeRequired,
  });

  final String image;
  final String title;
  final String description;
  final num rating;
  final int timeRequired;

  @override
  State<RecentlyAddedItem> createState() => _RecentlyAddedWidgetState();
}

class _RecentlyAddedWidgetState extends State<RecentlyAddedItem> {
  bool isTapLike = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 169.w,
          height: 226.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteBeigeFFFDF9,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(14.r),
                    ),
                    border: BoxBorder.all(
                      color: AppColors.pinkColorEC888D,
                    ),
                  ),
                  width: 159.w,
                  height: 76.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Styles.s12w400brown3E2823,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.description,
                          style: Styles.s13w300brown3E2823,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          children: [
                            Row(
                              spacing: 5.w,
                              children: [
                                Text(
                                  '${widget.rating}',
                                  style: Styles.s12w400pinkColorEC888D,
                                ),
                                SvgPicture.asset(
                                  AppIcons.star,
                                  width: 10.w,
                                  height: 10.h,
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: 6.w,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.clock,
                                  width: 10.w,
                                  height: 10.h,
                                ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.network(
                  widget.image,
                  width: 169.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 7, right: 8),
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
        ),
      ],
    );
  }
}
