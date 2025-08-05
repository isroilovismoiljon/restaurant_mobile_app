import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/categories/managers/category_details_view_model.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';

import '../../../core/utils/icons.dart';
import '../../common/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });

  final int categoryId;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CategoryDetailsViewModel(categoryId);
      },
      builder: (context, child) {
        return Consumer<CategoryDetailsViewModel>(
          builder: (context, vm, child) {
            return Scaffold(
              extendBody: true,
              backgroundColor: AppColors.backgroundColor,
              appBar: MyAppBar(categoryTitle: categoryTitle),
              body: Consumer<CategoryDetailsViewModel>(
                builder: (context, vm, child) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(37, 19, 37, 5),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 19,
                                  mainAxisExtent: 226,
                                ),
                            itemCount: vm.categoryDetails.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 76.h,
                                      width: 159.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteBeigeFFFDF9,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(14),
                                          bottomRight: Radius.circular(14),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          15,
                                          10,
                                          15,
                                          7,
                                        ),
                                        child: Column(
                                          spacing: 1,
                                          children: [
                                            Text(
                                              vm.categoryDetails[index]['title'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.color3E2823,
                                              ),
                                            ),
                                            Text(
                                              vm.categoryDetails[index]['description'],
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.color3E2823,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              spacing: 40.w,
                                              children: [
                                                Row(
                                                  spacing: 5.w,
                                                  children: [
                                                    Text(
                                                      "${vm.categoryDetails[index]['rating']}",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .pinkColorEC888D,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      AppIcons.star,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  spacing: 5,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppIcons.clock,
                                                    ),
                                                    Text(
                                                      "${vm.categoryDetails[index]['timeRequired']}min",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .pinkColorEC888D,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.4,
                                            ),
                                            blurRadius: 3,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Image.network(
                                          vm.categoryDetails[index]['photo'],
                                          width: 169.w,
                                          height: 153.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
      },
    );
  }
}
