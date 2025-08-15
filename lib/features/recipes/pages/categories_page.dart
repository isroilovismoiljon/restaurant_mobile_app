import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/recipes/managers/categories_page_view_model.dart';
import 'package:restourant_mobile_app/features/recipes/widget/category_page_items.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../../common/app_bar/my_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesPageViewModel(categoryRepo: context.read())..getCategories(),
      builder: (context, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.backgroundColor,
          appBar: MyAppBar(categoryTitle: "Categories"),
          body: Consumer<CategoriesPageViewModel>(
            builder: (context, vm, child) {
              return vm.isLoading
                ? Center(child: CircularProgressIndicator(),)
                : Padding(
                padding: const EdgeInsets.fromLTRB(37, 5, 37, 5),
                child: Column(children: [CategoryItems(vm: vm,)]),
              );
            },
          ),
          bottomNavigationBar: MyBottomNavigationBar(),
        );
      },
    );
  }
}
