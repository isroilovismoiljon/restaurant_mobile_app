import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/categories/managers/category_details_view_model.dart';
import 'package:restourant_mobile_app/features/categories/widget/category_details_page_item.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';

import '../bottom_navigation_bar/my_bottom_navigation_bar.dart';

class AppBarBottom extends StatelessWidget {
  AppBarBottom({super.key, required this.vm});
  final ScrollController _scrollController = ScrollController();

  final CategoryDetailsViewModel vm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39.h,
      width: 405.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          children: [
            ...List.generate(vm.categories.length, (index) {
              return TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:
                      vm.selectedCategoryId == vm.categories[index].id
                      ? AppColors.redPinkFD5D69
                      : Colors.transparent,
                ),
                onPressed: () {
                  final vm = context.read<CategoryDetailsViewModel>();
                  vm.getCategoryDetails(
                    vm.categories[index].id,
                    vm.categories[index].title,
                  );
                  if (index > 0 && index < vm.categories.length - 1) {
                    double itemWidth = 100.w;
                    double screenWidth = MediaQuery.of(context).size.width;
                    double scrollTo = (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

                    _scrollController.animateTo(
                      scrollTo,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  vm.categories[index].title,
                  style: vm.selectedCategoryId == vm.categories[index].id
                      ? Styles.s16w400white
                      : Styles.s16w400redPink,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
