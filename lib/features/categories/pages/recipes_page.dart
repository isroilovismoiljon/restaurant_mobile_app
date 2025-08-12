import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/categories/managers/recipes_view_model.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';

import '../../common/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key, required this.categoryDetail});

  final Map categoryDetail;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel(categoryDetail['recipeId']),
      builder: (context, child) {
        return Consumer<RecipeViewModel>(
          builder: (context, vm, child) {
            return vm.isLoading
                ? Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  )
                : Scaffold(
                    extendBody: true,
                    backgroundColor: AppColors.backgroundColor,
                    appBar: MyAppBar(
                      categoryTitle: categoryDetail['recipeTitle'],
                      actions: [AppIcons.heart, AppIcons.share],
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(36.5, 26, 37.5, 125),
                        child: Column(
                          spacing: 31.h,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child: Container(
                                padding: EdgeInsets.only(bottom: 12.h),
                                alignment: Alignment.topCenter,
                                width: 356.w,
                                height: 337.h,
                                decoration: BoxDecoration(
                                  color: AppColors.redPinkFD5D69,
                                ),
                                child: Column(
                                  spacing: 12.h,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                      child: Image.network(
                                        width: 356.w,
                                        height: 281.h,
                                        fit: BoxFit.cover,
                                        vm.recipe!.photo,
                                      ),
                                    ),
                                    Row(
                                      spacing: 15.w,
                                      children: [
                                        SizedBox(),
                                        SizedBox(
                                          width: 220.w,
                                          child: Text(
                                            vm.recipe!.title,
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
                                                SvgPicture.asset(
                                                  AppIcons.starFilled,
                                                ),
                                                Text(
                                                  "${vm.recipe!.rating}",
                                                  style:
                                                      Styles.s12w400whiteFFFDF9,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              spacing: 5.w,
                                              children: [
                                                SvgPicture.asset(
                                                  AppIcons.reviews,
                                                ),
                                                Text(
                                                  "${vm.recipe!.reviewsCount}",
                                                  style:
                                                      Styles.s12w400whiteFFFDF9,
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
                            Row(
                              spacing: 12.w,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    32,
                                  ),
                                  child: Image.network(
                                    vm.recipe!.chef.profilePhoto,
                                    width: 64.w,
                                    height: 64.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 133.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "@${vm.recipe!.chef.username}",
                                        style: Styles.s12w400redPinkFD5D69,
                                      ),
                                      Text(
                                        "${vm.recipe!.chef.firstName} ${vm.recipe!.chef.lastName}",
                                        style: Styles.s14w300whiteFFFDF9,
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.pinkFFC6C9,
                                    fixedSize: Size(110.w, 21.h),
                                  ),
                                  child: Text(
                                    "Follow",
                                    style: Styles.s15w500pinkEC888D,
                                  ),
                                ),
                                SvgPicture.asset(
                                  AppIcons.threeDots,
                                  color: AppColors.redPinkFD5D69,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  spacing: 7.w,
                                  children: [
                                    Text(
                                      "Details",
                                      style: Styles.s20w600redPinkFD5D69,
                                    ),
                                    SizedBox(width: 8),
                                    SvgPicture.asset(
                                      AppIcons.clock,
                                      color: AppColors.whiteBeigeFFFDF9,
                                    ),
                                    Text(
                                      "${vm.recipe!.timeRequired}min",
                                      style: Styles.s12w400whiteFFFDF9,
                                    ),
                                  ],
                                ),
                                Text(
                                  vm.recipe!.description,
                                  style: Styles.s12w400whiteFFFDF9,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ingredients",
                                    style: Styles.s20w600redPinkFD5D69,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  ...List.generate(
                                    vm.recipe!.ingredients.length,
                                    (index) {
                                      return Text(
                                        "${vm.recipe!.ingredients[index].amount} ${vm.recipe!.ingredients[index].name}",
                                        style: Styles.s12w400whiteFFFDF9,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              spacing: 10.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${vm.recipe!.instructions.length} easy Steps",
                                  style: Styles.s20w600redPinkFD5D69,
                                ),

                                Column(
                                  spacing: 11.h,
                                  children: [
                                    ...List.generate(vm.recipe!.instructions.length, (
                                      index,
                                    ) {
                                      return Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          23,
                                          13,
                                          22,
                                        ),
                                        width: 356.w,
                                        height: 81.h,
                                        decoration: BoxDecoration(
                                          color: index % 2 == 0
                                              ? AppColors.pinkColorEC888D
                                              : AppColors.pinkFFC6C9,
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        child: Text(
                                          "${index + 1}. ${vm.recipe!.instructions[index].text}",
                                          style: Styles.s12w400black1C0F0D,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottomNavigationBar: MyBottomNavigationBar(),
                  );
          },
        );
      },
    );
  }
}
