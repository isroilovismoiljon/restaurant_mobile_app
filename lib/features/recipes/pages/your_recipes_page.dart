import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/data/models/recipes/your_recipe_model.dart';
import 'package:restourant_mobile_app/features/recipes/managers/yuor_recipe_vm.dart';
import 'package:restourant_mobile_app/features/recipes/widget/category_details_page_item.dart';
import '../../common/widgets/app_bar/my_app_bar.dart';
import '../../common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../../home/widgets/your_recipe_widget.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourRecipeViewModel(repository: context.read()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(categoryTitle: 'Your Recipes'),
        body: SingleChildScrollView(
          child: Column(
            spacing: 30.h,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 38.w),
                decoration: BoxDecoration(
                  color: AppColors.redPinkFD5D69,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  spacing: 9.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Viewed Today',
                      style: AppStyles.s15w500whiteBeigeFFFDF9,
                    ),
                    Selector<YourRecipeViewModel, (bool, List<YourRecipeModel>)>(
                      selector: (context, vm) => (vm.isLoadingMostViewed, vm.mostViewedToday),
                      builder: (context, value, child) {
                        final (isLoading, mostViewedRecipe) = value;
                        return isLoading
                            ? Center(child: CircularProgressIndicator())
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ...List.generate(
                                    2,
                                    (index) {
                                      return YourRecipeWidget(
                                        image: mostViewedRecipe[index].photo,
                                        title: mostViewedRecipe[index].title,
                                        rating: mostViewedRecipe[index].rating,
                                        timeRequired: mostViewedRecipe[index].timeRequired,
                                      );
                                    },
                                  ),
                                ],
                              );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: Selector<YourRecipeViewModel, (bool, List<YourRecipeModel>)>(
                  selector: (context, vm) => (vm.isLoadingAllYourRecipes, vm.allYourRecipes),
                  builder: (context, value, child) {
                    final (isLoading, allYourRecipe) = value;
                    return isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CategoryDetailsPageItem(categoryDetails: allYourRecipe);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
