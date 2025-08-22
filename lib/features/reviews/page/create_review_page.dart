import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:restourant_mobile_app/features/reviews/page/create_review_button.dart';
import 'package:restourant_mobile_app/features/reviews/widgets/recommend_recipe_radio.dart';

class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({super.key, this.recipeId = 10});

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(
        categoryTitle: 'Leave A Review',
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 262.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 356.w,
                      height: 262.h,
                      decoration: BoxDecoration(
                        color: AppColors.redPinkFD5D69,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        'https://riki.dotabuff.com/t/l/JejpeHjfDR.png',
                        width: 356.w,
                        height: 206.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Chicken Burger',
                          style: Styles.s20w500whiteFFFDF9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              index + 1 < 4 ? AppIcons.starFilled : AppIcons.starEmpty,
                              width: 29.w,
                              height: 29.h,
                              colorFilter: ColorFilter.mode(AppColors.redPinkFD5D69, BlendMode.srcIn),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Your overall rating',
                    style: Styles.s12w400whiteFFFDF9,
                  ),
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.pinkFFC6C9,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
                  hintText: 'Leave us Review!',
                  hintStyle: Styles.s15w400beige1C0F0D_opacity45,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                spacing: 8.w,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: AppColors.pinkColorEC888D,
                      size: 15.h,
                    ),
                    padding: EdgeInsets.all(4.r),
                    constraints: BoxConstraints(minWidth: 21.w, minHeight: 21.h),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.pinkFFC6C9,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Text(
                    'Add Photo',
                    style: Styles.s15w500whiteBeigeFFFDF9,
                  ),
                ],
              ),
              SizedBox(
                height: 23.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you recommend this recipe?',
                    style: Styles.s12w400whiteFFFDF9.copyWith(height: 1.h),
                  ),
                  RecommendRecipeRadio(),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CreateReviewButton(
                    title: 'Cancel',
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  CreateReviewButton(
                    title: 'Submit',
                    backgroundColor: AppColors.redPinkFD5D69,
                    textStyle: Styles.s15w500whiteBeigeFFFDF9,
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(34.w, 45.h, 34.w, 30.h),
                              width: 276.w,
                              height: 359.h,
                              decoration: BoxDecoration(
                                color: AppColors.whiteD9D9D9,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 20.h,
                                children: [
                                  Column(
                                    spacing: 15.h,
                                    children: [
                                      Text(
                                        'Thank You For Your Review!',
                                        style: Styles.s20w600beige1C0F0D,
                                        textAlign: TextAlign.center,
                                      ),
                                      SvgPicture.asset(AppIcons.bigTick, width: 59.w),
                                      Text(
                                        'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.',
                                        style: Styles.s13w400beige1C0F0D,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.go(Routers.home);
                                    },
                                    style: TextButton.styleFrom(backgroundColor: AppColors.redPinkFD5D69),
                                    child: Text(
                                      'Go To Home',
                                      style: Styles.s20w600whiteFFFDF9,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
