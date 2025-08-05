import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/categories/managers/categories_page_view_model.dart';
import 'package:restourant_mobile_app/features/categories/pages/category_details.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';

import '../../common/app_bar/my_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CategoriesPageViewModel();
      },
      builder: (context, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.backgroundColor,
          appBar: MyAppBar(categoryTitle: "Categories"),
          body: Consumer<CategoriesPageViewModel>(
            builder: (context, vm, child) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(37, 5, 37, 5),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 185,
                        ),
                        itemCount: vm.categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CategoryDetails(
                                    categoryId: vm.categories[index]['id'],
                                    categoryTitle:
                                        vm.categories[index]['title'],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              spacing: 6,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.network(
                                    vm.categories[index]['image'],
                                    width: 159.w,
                                    height: 146.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  vm.categories[index]['title'],
                                  style: TextStyle(
                                    fontSize: 14.23,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteBeigeFFFDF9,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: MyBottomNavigationBar(),
        );
      },
    );
  }
}
