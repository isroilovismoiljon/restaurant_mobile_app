import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/reviews/managers/reviews_vm.dart';
import 'package:restourant_mobile_app/features/reviews/widgets/review_comment.dart';
import 'package:restourant_mobile_app/features/reviews/widgets/reviews_recipe.dart';

import '../../common/widgets/app_bar/my_app_bar.dart';
import '../../common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.recipeId});

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(recipeId: recipeId, repository: context.read()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(
          categoryTitle: 'Reviews',
          actions: [],
        ),
        body: Consumer<ReviewsViewModel>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 17.h,
                  ),
                  ReviewsRecipe(
                    vm: vm,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 27.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 17.h,
                      children: [
                        Text(
                          'Comments',
                          style: Styles.s15w500redPinkFD5D69,
                        ),
                        vm.isLoadingRecipe
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : vm.reviews.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 50.h),
                                  child: Text(
                                    'Comments not found!',
                                    style: Styles.s15w500whiteBeigeFFFDF9,
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  ...List.generate(
                                    vm.reviews.length,
                                    (index) {
                                      final String? profilePhoto = vm.reviews[index].user!.profilePhoto;
                                      return Column(
                                        spacing: 10.h,
                                        children: [
                                          ReviewComment(
                                            vm: vm,
                                            index: index,
                                          ),
                                          Divider(
                                            color: AppColors.pinkColorEC888D,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ],
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
            );
          },
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
