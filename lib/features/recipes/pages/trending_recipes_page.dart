import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/recipes/managers/trending_recipes_vm.dart';
import '../../common/widgets/app_bar/my_app_bar.dart';
import '../../common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../../home/widgets/trading_recipe.dart';

class TrendingRecipesPage extends StatelessWidget {
  const TrendingRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TrendingRecipesViewModel(context.read()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(categoryTitle: 'Trending Recipes'),
        body: Consumer<TrendingRecipesViewModel>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 125.h),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 241.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.redPinkFD5D69,
                      ),
                      padding: EdgeInsets.only(
                        top: 9.h,
                        bottom: 18.h,
                        right: 36.w,
                        left: 36.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 9.h,
                        children: [
                          Text(
                            'Most Viewed Today',
                            style: AppStyles.s15w500whiteBeigeFFFDF9,
                          ),
                          SizedBox(
                            width: 358.w,
                            height: 183.h,
                            child: vm.recipesIsLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : TradingRecipe(
                                    title: vm.trendingRecipe!.title,
                                    description: vm.trendingRecipe!.description,
                                    photo: vm.trendingRecipe!.photo,
                                    timeRequired:
                                        vm.trendingRecipe!.timeRequired,
                                    rating: vm.trendingRecipe!.rating,
                                    colorContainer: AppColors.whiteBeigeFFFDF9,
                                    colorDescription: AppColors.brown1C0F0D,
                                    colorTitle: AppColors.brown1C0F0D,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.w),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {},
                              child: GestureDetector(
                                onTap: (){context.push(Routers.categoryDetails, extra: {'categoryId': 1, 'categoryTitle': 'Breakfast'});},
                                child: Text(
                                  'See All',
                                  style: AppStyles.s12w500redPinkFD5D69,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            spacing: 15.h,
                            children: [
                              ...List.generate(
                                vm.recipes.length,
                                (index) {
                                  return vm.recipesIsLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                              child: Image.network(
                                                vm.recipes[index].photo,
                                                width: 150.w,
                                                height: 150.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 207.w,
                                              height: 122.h,
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColors.whiteBeigeFFFDF9,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                      right: Radius.circular(
                                                        14.r,
                                                      ),
                                                    ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 10.w,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      vm.recipes[index].title,
                                                      style: AppStyles
                                                          .s12w400brown3E2823,
                                                    ),
                                                    Text(
                                                      vm
                                                          .recipes[index]
                                                          .description,
                                                      style: AppStyles
                                                          .s13w300brown3E2823
                                                          .copyWith(
                                                            height: 1.h,
                                                          ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      "By Chef Kimdir",
                                                      style: AppStyles
                                                          .s12w300redPinkFD5D69,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          spacing: 4.w,
                                                          children: [
                                                            SvgPicture.asset(
                                                              AppIcons.clock,
                                                            ),
                                                            Text(
                                                              '${vm.recipes[index].timeRequired}min',
                                                              style: AppStyles
                                                                  .s12w400redPinkFD5D69,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          spacing: 4.w,
                                                          children: [
                                                            Text(
                                                              vm
                                                                  .recipes[index]
                                                                  .difficulty,
                                                              style: AppStyles
                                                                  .s12w400redPinkFD5D69,
                                                            ),
                                                            SvgPicture.asset(
                                                              AppIcons.vector,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          spacing: 4.w,
                                                          children: [
                                                            Text(
                                                              "${vm.recipes[index].rating}",
                                                              style: AppStyles
                                                                  .s12w400redPinkFD5D69,
                                                            ),
                                                            SvgPicture.asset(
                                                              AppIcons.star,
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
                                        );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
