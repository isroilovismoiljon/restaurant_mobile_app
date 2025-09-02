import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/home/widgets/trading_recipe.dart';

import '../managers/home_vm.dart';

class TrendingRecipeWidget extends StatelessWidget {
  const TrendingRecipeWidget({
    super.key, required this.vm,
  });
  final HomeViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 9.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trending Recipe",
          style: AppStyles.s15w500redPinkFD5D69,
        ),
        SizedBox(
          width: 358.w,
          height: 182.h,
          child: TradingRecipe(
            title: vm.trendingRecipe.title,
            description: vm.trendingRecipe.description,
            photo: vm.trendingRecipe.photo,
            timeRequired: vm.trendingRecipe.timeRequired,
            rating: vm.trendingRecipe.rating,
          ),
        ),
      ],
    );
  }
}
