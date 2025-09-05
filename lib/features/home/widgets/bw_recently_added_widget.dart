import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_details_model.dart';
import '../managers/home_vm.dart';
import 'recently_added_item.dart';

class RecentlyAddedWidget extends StatelessWidget {
  const RecentlyAddedWidget({
    super.key,
    required this.recentlyAddedRecipe, required this.vm,
  });

  final HomeViewModel vm;
  final List<RecipeDetailsModel> recentlyAddedRecipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6.h,
      children: [
        Text(
          'Recently Added',
          style: AppStyles.s15w500redPinkFD5D69,
        ),
        vm.isLoadingRecentlyRecipes
            ? Center(
                child: CircularProgressIndicator(),
              )
            : vm.errorRecentlyRecipes != null
            ? Center(
                child: Text(
                  vm.errorRecentlyRecipes!,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecentlyAddedItem(
                    image: recentlyAddedRecipe[0].photo,
                    title: recentlyAddedRecipe[0].title,
                    description: recentlyAddedRecipe[0].description,
                    rating: recentlyAddedRecipe[0].rating,
                    timeRequired: recentlyAddedRecipe[0].timeRequired,
                  ),
                  RecentlyAddedItem(
                    image: recentlyAddedRecipe[1].photo,
                    title: recentlyAddedRecipe[1].title,
                    description: recentlyAddedRecipe[1].description,
                    rating: recentlyAddedRecipe[1].rating,
                    timeRequired: recentlyAddedRecipe[1].timeRequired,
                  ),
                ],
              ),
      ],
    );
  }
}
