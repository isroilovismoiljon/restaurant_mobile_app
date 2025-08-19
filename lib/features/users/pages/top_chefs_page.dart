import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:restourant_mobile_app/features/users/managers/top_chefs_vm.dart';
import 'package:restourant_mobile_app/features/users/widgets/chefs_item.dart';

class TopChefsPage extends StatelessWidget {
  const TopChefsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TopChefsViewModel(repository: context.read()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(categoryTitle: 'Top Chef'),
        body: Consumer<TopChefsViewModel>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 125.h),
                child: Column(
                  children: [
                    vm.isLoadingMostViewedChefs
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            padding: EdgeInsets.fromLTRB(36.w, 12.h, 36.w, 20.h),
                            width: double.infinity,
                            height: 285.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColors.redPinkFD5D69,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Most Viewed Chefs',
                                  style: Styles.s15w500whiteBeigeFFFDF9,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      2,
                                      (index) {
                                        return ChefsItem(
                                          chefModel: vm.mostViewedChefs,
                                          index: index,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    vm.isLoadingMostLikedChefs
                        ? Center(child: CircularProgressIndicator())
                        : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 15.h),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 9.h,
                              children: [
                                Text(
                                  'Most Liked Chefs',
                                  style: Styles.s15w500redPinkFD5D69,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      2,
                                      (index) {
                                        return ChefsItem(
                                          chefModel: vm.mostLikedChefs,
                                          index: index,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ),
                    vm.isLoadingNewChefs
                        ? Center(child: CircularProgressIndicator())
                        : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 15.h),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 9.h,
                              children: [
                                Text(
                                  'New Chefs',
                                  style: Styles.s15w500redPinkFD5D69,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      2,
                                      (index) {
                                        return ChefsItem(
                                          chefModel: vm.newChefs,
                                          index: index
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
