import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../common/app_bar/app_bar_leading_back_arrow.dart';
import '../widgets/indicator_on_boarding.dart';
import '../widgets/to_next_page_button.dart';

final levelList = [
  {
    'title': 'Novice',
    'description': "Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam."
  },
  {
    'title': 'Intermediate',
    'description': "Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque pulvinar diam."
  },
  {
    'title': 'Advanced',
    'description': "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam."
  },
  {
    'title': 'Professional',
    'description': "Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada."
  },
];

class CookingLevelPage extends StatefulWidget {
  const CookingLevelPage({super.key});

  @override
  State<CookingLevelPage> createState() => _CookingLevelPageState();
}

class _CookingLevelPageState extends State<CookingLevelPage> {
  int selectedItemNum = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: AppBarLeadingBackArrow(onPressed: () {Navigator.of(context).pop();  },),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 5.h, 37.w, 9.35.h),
        child: Column(
          spacing: 32.h,
          children: [
            IndicatorOnBoarding(
              alignment: Alignment.topLeft,
            ),
            Column(
              spacing: 20.h,
              children: [
                Text(
                  "¿What is your cooking level?",
                  style: Styles.s20w600whiteFFFDF9,
                ),
                Text(
                  "Please select you cooking level for a better recommendations.",
                  style: Styles.s13w400whiteFFFDF9,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ...List.generate(levelList.length, (index) {
              return GestureDetector(
                onTap: (){
                  selectedItemNum = index;
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r,), border: BoxBorder.all(color: selectedItemNum == index ? AppColors.redPinkFD5D69 : AppColors.pinkFFC6C9)),
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 17.w),
                  child: Column(
                    spacing: 4.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${levelList[index]['title']}", style: Styles.s16w500whiteFFFDF9,),
                      Text(
                        "${levelList[index]['description']}",
                        style: Styles.s13w400whiteFFFDF9,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );

            },),
            ToNextPageButton(title: 'Continue', onPressed: () { context.push(Routers.cuisinesPage); },)
          ],
        ),
      ),
    );
  }
}
