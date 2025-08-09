import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/router/routes.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/app_bar_leading_back_arrow.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: AppBarLeadingBackArrow(
          onPressed: () {
            context.push(Routers.onboarding);
          },
        ),
        leadingWidth: 100.w,
      ),
      body: Column(
        spacing: 15.h,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36, 19, 38, 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 27.h,
                  crossAxisSpacing: 24.w,
                  mainAxisExtent: 170,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://avatars.mds.yandex.net/i?id=0b934814f611e1d360747686a2e9b157_l-5276454-images-thumbs&n=13",
                          width: 166.w,
                          height: 166.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Text(
            "Welcome",
            style: Styles.s25w600whiteBeigeFFFDF9,
          ),
          Text(
            "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
            style: Styles.s13w400whiteFFFDF9,
          ),
          ToNextPageButton(
            buttonTextStyle: Styles.s20w600pinkEC888D,
            buttonBackgroundColor: AppColors.pinkFFC6C9,
            title: 'I’m New',
            onPressed: () {
              context.push(Routers.cookingLevelPage);
            },
          ),
          ToNextPageButton(
            buttonTextStyle: Styles.s20w600pinkEC888D,
            buttonBackgroundColor: AppColors.pinkFFC6C9,
            title: 'I’ve Been Here ',
            onPressed: () {
              context.push(Routers.categoriesPage);
            },
          ),
          SizedBox(height: 25.h,)
        ],
      ),
    );
  }
}
