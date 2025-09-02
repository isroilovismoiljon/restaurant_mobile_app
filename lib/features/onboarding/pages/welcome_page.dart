import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/recipes/managers/categories_page_view_model.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';

import '../../common/widgets/app_bar/app_bar_leading_back_arrow.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesPageViewModel(context.read()),
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: AppBarLeadingBackArrow(
            onPressed: () {
              context.push(Routers.onboarding);
            },
          ),
          leadingWidth: 80.w,
        ),
        body: Consumer<CategoriesPageViewModel>(
          builder: (context, vm, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 13.h,
                children: [
                  vm.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: SizedBox(
                            height: 565.h,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 27.w,
                                    crossAxisSpacing: 24.w,
                                    mainAxisExtent: 170.h,
                                  ),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.r),
                                      child: Image.network(
                                        vm.categories[index].image,
                                        width: 166.w,
                                        height: 166.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                  Text(
                    "Welcome",
                    style: AppStyles.s25w600whiteBeigeFFFDF9,
                  ),
                  Text(
                    "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
                    style: AppStyles.s13w400whiteFFFDF9,
                  ),
                  ToNextPageButton(
                    buttonTextStyle: AppStyles.s20w600pinkEC888D,
                    buttonBackgroundColor: AppColors.pinkFFC6C9,
                    title: 'I’m New',
                    onPressed: () {
                      context.push(Routers.cookingLevelPage);
                    },
                  ),
                  ToNextPageButton(
                    buttonTextStyle: AppStyles.s20w600pinkEC888D,
                    buttonBackgroundColor: AppColors.pinkFFC6C9,
                    title: 'I’ve Been Here ',
                    onPressed: () {
                      context.push(Routers.categoriesPage);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
