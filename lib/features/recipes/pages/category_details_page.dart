import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/recipes/managers/category_details_view_model.dart';
import 'package:restourant_mobile_app/features/common/app_bar/app_bar_bottom.dart';
import 'package:restourant_mobile_app/features/recipes/widget/category_details_page_item.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import '../../../core/utils/styles.dart';
import '../../common/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class CategoryDetails extends StatelessWidget {
  final Map items;

  const CategoryDetails({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      key: ValueKey(items['categoryId']),
      create: (context) {
        return CategoryDetailsViewModel(
            items['categoryId'],
            recipeRepo: context.read(),
          )
          ..getCategoryDetails(items['categoryId'], items['categoryTitle'])
          ..getCategories();
      },
      builder: (context, child) {
        return Consumer<CategoryDetailsViewModel>(
          builder: (context, vm, child) {
            return Scaffold(
              extendBody: true,
              backgroundColor: AppColors.backgroundColor,
              appBar: MyAppBar(
                categoryTitle: vm.selectedCategoryTitle.isEmpty
                    ? items['categoryTitle']
                    : vm.selectedCategoryTitle,
              ),
              body: Consumer<CategoryDetailsViewModel>(
                builder: (context, vm, child) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 5.h),
                      child: Column(
                        children: [
                          vm.categoriesLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : AppBarBottom(
                                  vm: vm,
                                ),
                          SizedBox(height: 19.h),
                          vm.categoryDetailsLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : vm.categoryDetails.isEmpty
                              ? Center(
                                  child: Text(
                                    'Recipes is Empty in this Category',
                                    style: Styles.s15w500redPinkFD5D69,
                                  ),
                                )
                              : CategoryDetailsPageItem(
                                  categoryDetails: vm.categoryDetails,
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              bottomNavigationBar: MyBottomNavigationBar(),
            );
          },
        );
      },
    );
  }
}
