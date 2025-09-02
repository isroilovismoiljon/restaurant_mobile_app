import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/recipes/managers/recipes_view_model.dart';

import '../../common/widgets/app_bar/my_app_bar.dart';
import '../../common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key, required this.categoryDetail});

  final Map categoryDetail;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel(
        recipeRepository: context.read(),
        id: categoryDetail['recipeId'],
      ),
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
                        padding: EdgeInsets.fromLTRB(
                          36.5.w,
                          16.h,
                          37.5.w,
                          125.h,
                        ),
                        child: Column(
                          spacing: 31.h,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10.r),
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
                                          BorderRadiusGeometry.circular(10.r),
                                      child: Image.network(
                                        width: 356.w,
                                        height: 281.h,
                                        fit: BoxFit.cover,
                                        vm.recipe!.photo,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                                      child: GestureDetector(
                                        onTap: (){
                                          context.push(Routers.reviewsPage, extra: vm.recipe!.id);
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 220.w,
                                              child: Text(
                                                vm.recipe!.title,
                                                style: AppStyles.s20w500whiteFFFDF9,
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
                                                          AppStyles.s12w400whiteFFFDF9,
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
                                                          AppStyles.s12w400whiteFFFDF9,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
                                    32.r,
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
                                        style: AppStyles.s12w400redPinkFD5D69,
                                      ),
                                      Text(
                                        "${vm.recipe!.chef.firstName} ${vm.recipe!.chef.lastName}",
                                        style: AppStyles.s14w300whiteFFFDF9,
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
                                    style: AppStyles.s15w500pinkEC888D,
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
                                      style: AppStyles.s20w600redPinkFD5D69,
                                    ),
                                    SizedBox(width: 8.w),
                                    SvgPicture.asset(
                                      AppIcons.clock,
                                      color: AppColors.whiteBeigeFFFDF9,
                                    ),
                                    Text(
                                      "${vm.recipe!.timeRequired}min",
                                      style: AppStyles.s12w400whiteFFFDF9,
                                    ),
                                  ],
                                ),
                                Text(
                                  vm.recipe!.description,
                                  style: AppStyles.s12w400whiteFFFDF9,
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
                                    style: AppStyles.s20w600redPinkFD5D69,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  ...List.generate(
                                    vm.recipe!.ingredients.length,
                                    (index) {
                                      return Text(
                                        "${vm.recipe!.ingredients[index].amount} ${vm.recipe!.ingredients[index].name}",
                                        style: AppStyles.s12w400whiteFFFDF9,
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
                                  style: AppStyles.s20w600redPinkFD5D69,
                                ),

                                Column(
                                  spacing: 11.h,
                                  children: [
                                    ...List.generate(
                                      vm.recipe!.instructions.length,
                                      (
                                        index,
                                      ) {
                                        return Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.fromLTRB(
                                            5.w,
                                            23.h,
                                            13.w,
                                            22.h,
                                          ),
                                          width: 356.w,
                                          height: 81.h,
                                          decoration: BoxDecoration(
                                            color: index % 2 == 0
                                                ? AppColors.pinkColorEC888D
                                                : AppColors.pinkFFC6C9,
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                          ),
                                          child: Text(
                                            "${index + 1}. ${vm.recipe!.instructions[index].text}",
                                            style: AppStyles.s12w400black1C0F0D,
                                          ),
                                        );
                                      },
                                    ),
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
