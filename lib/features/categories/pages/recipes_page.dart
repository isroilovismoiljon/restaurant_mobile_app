import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(categoryTitle: "Title"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(36.5, 26, 37.5, 5),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Container(
                padding: EdgeInsets.only(bottom: 12.h),
                alignment: Alignment.topCenter,
                width: 356.w,
                height: 337.h,
                decoration: BoxDecoration(color: AppColors.redPinkFD5D69),
                child: Column(
                  spacing: 12.h,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.network(
                        width: 356.w,
                        height: 281.h,
                        fit: BoxFit.cover,
                        "https://i.pinimg.com/736x/d5/c7/53/d5c75305c1e573f04689302cc8b07411.jpg",
                      ),
                    ),
                    Row(
                      spacing: 15.w,
                      children: [
                        SizedBox(),
                        SizedBox(
                          width: 220.w,
                          child: Text(
                            "Grilled Shrimps",
                            style: Styles.s20w500whiteFFFDF9,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          spacing: 10.w,
                          children: [
                            Row(
                              spacing: 5.w,
                              children: [
                                SvgPicture.asset(AppIcons.starFilled),
                                Text("5", style: Styles.s12w400whiteFFFDF9),
                              ],
                            ),
                            Row(
                              spacing: 5.w,
                              children: [
                                SvgPicture.asset(AppIcons.reviews),
                                Text("2.273", style: Styles.s12w400whiteFFFDF9),
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
            SizedBox(height: 31.h),
            Row(
              spacing: 12.w,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(30),
                  child: Image.network(
                    "https://i.pinimg.com/736x/d5/c7/53/d5c75305c1e573f04689302cc8b07411.jpg",
                    width: 63.w,
                    height: 63.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 133.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@flavorswithhivan",
                        style: Styles.s12w400redPinkFD5D69,
                      ),
                      Text("Ivan Valach", style: Styles.s14w300whiteFFFDF9),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.pinkFFC6C9,
                    fixedSize: Size(110.w, 21.h),
                  ),
                  child: Text("Follow", style: Styles.s15w500pinkEC888D),
                ),
                SvgPicture.asset(
                  AppIcons.threeDots,
                  color: AppColors.redPinkFD5D69,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
