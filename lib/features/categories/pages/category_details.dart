import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/categories/managers/category_details_view_model.dart';
import 'package:restourant_mobile_app/features/common/app_bar/app_bar_bottom.dart';
import 'package:restourant_mobile_app/features/categories/widget/category_details_page_item.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';

import '../../common/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class CategoryDetails extends StatelessWidget {
  final _scrollController = ScrollController();
  final Map items;
  CategoryDetails({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      key: ValueKey(items['categoryId']),
      create: (context) {
        return CategoryDetailsViewModel(items['categoryId']);
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
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(37, 19, 37, 5),
                    child: Column(
                      children: [
                        AppBarBottom(vm: vm,),
                        SizedBox(height: 19),
                        CategoryDetailsPageItem(vm: vm),
                      ],
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
