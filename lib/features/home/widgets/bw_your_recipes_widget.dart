import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import '../managers/home_vm.dart';
import 'your_recipe_widget.dart';

class YourRecipesWidget extends StatelessWidget {
  const YourRecipesWidget({
    super.key, required this.vm,
  });
  final HomeViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 38.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.redPinkFD5D69,
        borderRadius: BorderRadius.circular(20.r),
      ),
      width: double.infinity,
      height: 255.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 9.h,
        children: [
          Text(
            "Your Recipes",
            style: Styles.s15w500whiteBeigeFFFDF9,
          ),
          vm.isLoadingYourRecipes
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : vm.errorYourRecipes != null
              ? Center(
                  child: Text(vm.errorYourRecipes!),
                )
              : Row(
                  spacing: 17.w,
                  children: [
                    YourRecipeWidget(
                      image: vm.yourRecipes[0].photo,
                      title: vm.yourRecipes[0].title,
                      rating: vm.yourRecipes[0].rating,
                      timeRequired: vm.yourRecipes[0].timeRequired,
                    ),
                    YourRecipeWidget(
                      image: vm.yourRecipes[1].photo,
                      title: vm.yourRecipes[1].title,
                      rating: vm.yourRecipes[1].rating,
                      timeRequired: vm.yourRecipes[1].timeRequired,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
