import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../common/widgets/like/like.dart';

class CategoryDetailsPageItem extends StatefulWidget {
  const CategoryDetailsPageItem({super.key, required this.categoryDetails});

  final List categoryDetails;

  @override
  State<CategoryDetailsPageItem> createState() => _CategoryDetailsPageItemState();
}

class _CategoryDetailsPageItemState extends State<CategoryDetailsPageItem> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30.w,
        crossAxisSpacing: 19.w,
        mainAxisExtent: 226.h,
      ),
      itemCount: widget.categoryDetails.length,
      itemBuilder: (context, index) {

        bool isTapLike = false;
        return InkWell(
          onTap: () {
            context.push(
              Routers.recipesPage,
              extra: {
                'recipeId': widget.categoryDetails[index].id,
                'recipeTitle': widget.categoryDetails[index].title,
              },
            );
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 76.h,
                  width: 159.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteBeigeFFFDF9,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14.r),
                      bottomRight: Radius.circular(14.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 7.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.categoryDetails[index].title,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.color3E2823,
                              ),
                            ),
                            Text(
                              widget.categoryDetails[index].description,
                              style: TextStyle(
                                height: 1.h,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.color3E2823,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          spacing: 40.w,
                          children: [
                            Row(
                              spacing: 5.w,
                              children: [
                                Text(
                                  "${widget.categoryDetails[index].rating}",
                                  style: TextStyle(
                                    color: AppColors.pinkColorEC888D,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SvgPicture.asset(AppIcons.star),
                              ],
                            ),
                            Row(
                              spacing: 5.w,
                              children: [
                                SvgPicture.asset(AppIcons.clock),
                                Text(
                                  "${widget.categoryDetails[index].timeRequired}min",
                                  style: TextStyle(
                                    color: AppColors.pinkColorEC888D,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
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
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 3.r,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.network(
                      widget.categoryDetails[index].photo,
                      width: 169.w,
                      height: 153.h,
                      fit: BoxFit.cover,
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
      },
    );
  }
}
