import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/router/routes.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/indicator_on_boarding.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';

import '../../common/app_bar/app_bar_leading_back_arrow.dart';
import '../magagers/cuisine_view_model.dart';

class CuisinesPage extends StatelessWidget {
  const CuisinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CuisineViewModel(),
      builder: (context, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            leading: AppBarLeadingBackArrow(onPressed: () {Navigator.of(context).pop();  },),
            backgroundColor: AppColors.backgroundColor,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(36, 5, 37, 9.35),
            child: Column(
              spacing: 20.h,
              children: [
                IndicatorOnBoarding(alignment: Alignment.center,),
                SizedBox(height: 5),
                Text(
                  "Select your cuisines preferences",
                  style: Styles.s20w600whiteFFFDF9,
                ),
                Text(
                  "Please select your cuisines preferences for a better recommendations or you can skip it.",
                  style: Styles.s13w400whiteFFFDF9,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Consumer<CuisineViewModel>(
                    builder: (context, vm, child) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.16,
                          crossAxisSpacing: 9.72,
                          mainAxisExtent: 127,
                        ),
                        itemCount: vm.cuisines.length,
                        itemBuilder: (context, index) {
                          return Column(
                            spacing: 6,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  11.74,
                                ),
                                child: Image.network(
                                  vm.cuisines[index].image,
                                  width: 98.w,
                                  height: 99.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                vm.cuisines[index].title,
                                style: Styles.s13w500whiteFFFDF9,
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

          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 60.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 32.w,
              children: [
                ToNextPageButton(
                  title: 'Skip',
                  buttonBackgroundColor: AppColors.pinkFFC6C9,
                  buttonTextStyle: Styles.s20w600pinkEC888D, onPressed: () {  },
                ),
                ToNextPageButton(title: 'Continue', onPressed: () {context.push(Routers.allergicPage); },),
              ],
            ),
          ),
        );
      },
    );
  }
}
