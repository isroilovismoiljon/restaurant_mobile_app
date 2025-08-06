import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../common/app_bar/app_bar_leading_back_arrow.dart';
import '../widgets/indicator_on_boarding.dart';

class CookingLevelPage extends StatelessWidget {
  const CookingLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: AppBarLeadingBackArrow(),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(36, 5, 37, 9.35),
        child: Column(
          children: [
            IndicatorOnBoarding(alignment: Alignment.topLeft,),

          ]

        ),
      ),
    );
  }
}
