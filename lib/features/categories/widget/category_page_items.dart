import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/router/routes.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/categories/managers/categories_page_view_model.dart';
import 'package:restourant_mobile_app/features/categories/pages/category_details.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';

import '../../common/app_bar/my_app_bar.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key, required this.vm});
  final CategoriesPageViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 185,
        ),
        itemCount: vm.categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.push(Routers.categoryDetails, extra: {
                'categoryId': vm.categories[index].id,
                'categoryTitle': vm.categories[index].title
              });
            },
            child: Column(
              spacing: 6,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    vm.categories[index].image,
                    width: 159.w,
                    height: 146.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  vm.categories[index].title,
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
    );
  }
}
