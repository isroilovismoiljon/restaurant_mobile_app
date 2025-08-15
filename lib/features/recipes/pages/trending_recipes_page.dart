import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';

import '../../home/widgets/trading_recipe.dart';

class TrendingRecipesPage extends StatelessWidget {
  const TrendingRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(categoryTitle: 'Trending Recipes'),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 241.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.redPinkFD5D69,
              ),
              padding: const EdgeInsets.only(
                top: 9,
                bottom: 18,
                right: 36,
                left: 36,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 9,
                children: [
                  Text(
                    'Most Viewed Today',
                    style: Styles.s15w500whiteBeigeFFFDF9,
                  ),
                  SizedBox(
                    width: 358.w,
                    height: 183.h,
                    child: TradingRecipe(
                      title: 'Salami and cheese pizza',
                      description:
                          'This is a quick overview of the ingredients asfsfwwfesf',
                      photo:
                          'https://naked-science.ru/wp-content/uploads/2020/12/fast-fud-pitstsa-burger-chipsy-lukovye-koltsa-kartofel-fri.jpg',
                      timeRequired: 30,
                      rating: 5,
                      colorContainer: AppColors.whiteBeigeFFFDF9,
                      colorDescription: AppColors.brown1C0F0D,
                      colorTitle: AppColors.brown1C0F0D,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: Styles.s12w500redPinkFD5D69,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1539136788836-5699e78bfc75?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        width: 150.w,
                          height: 150.h,
                          fit: BoxFit.cover,
                          
                        ),
                      ),
                      Container(
                        width: 207.w,
                        height: 122.h,
                        decoration: BoxDecoration(
                          color: AppColors.whiteBeigeFFFDF9,
                          borderRadius: BorderRadius.horizontal(right: Radius.circular(14.r))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chicken Curry', style: Styles.s12w400brown3E2823,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
