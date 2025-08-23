import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';

import '../../home/widgets/your_recipe_widget.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(categoryTitle: 'Your Recipes'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 255.h,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 38.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('most viewed today', style: Styles.s15w500whiteBeigeFFFDF9,),
                Row(
                  children: [
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
