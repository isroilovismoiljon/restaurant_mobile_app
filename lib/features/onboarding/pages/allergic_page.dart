import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/onboarding/magagers/allergic_view_model.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/indicator_on_boarding.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';
import '../../common/widgets/app_bar/app_bar_leading_back_arrow.dart';
import '../../common/widgets/bottom_navigation_bar/bottom_navigation_bar_gradient.dart';

class AllergicPage extends StatelessWidget {
  const AllergicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllergicViewModel(),
      builder: (context, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            leading: AppBarLeadingBackArrow(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: AppColors.backgroundColor,
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(36.w, 5.h, 37.w, 9.35.h),
            child: Column(
              spacing: 20.h,
              children: [
                IndicatorOnBoarding(
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: 5.h),
                Text(
                  "¿You have any allergic?",
                  style: AppStyles.s20w600whiteFFFDF9,
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.",
                  style: AppStyles.s13w400whiteFFFDF9,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Consumer<AllergicViewModel>(
                    builder: (context, vm, child) {
                      return vm.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10.16.w,
                                    crossAxisSpacing: 9.72.w,
                                    mainAxisExtent: 127.h,
                                  ),
                              itemCount: vm.allergicFoods.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  spacing: 6.h,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(
                                            11.74.r,
                                          ),
                                      child: Image.network(
                                        vm.allergicFoods[index].image,
                                        width: 98.w,
                                        height: 99.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      vm.allergicFoods[index].title,
                                      style: AppStyles.s13w500whiteFFFDF9,
                                    ),
                                  ],
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BottomNavigationBarGradient(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 110.w),
                child: Container(
                  padding: EdgeInsets.only(bottom: 60.h),
                  child: ToNextPageButton(
                    title: 'Continue',
                    onPressed: () {
                      context.push(Routers.categoriesPage);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
