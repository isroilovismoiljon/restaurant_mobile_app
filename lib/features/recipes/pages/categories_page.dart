import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/features/recipes/managers/categories_page_view_model.dart';
import 'package:restourant_mobile_app/features/recipes/widget/category_page_items.dart';
import '../../common/widgets/app_bar/my_app_bar.dart';
import '../../common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesPageViewModel(context.read()),
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
                padding: EdgeInsets.fromLTRB(37.w, 5.h, 37.w, 5.h),
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
