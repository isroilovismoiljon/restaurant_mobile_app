import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';

class BottomNavigationBarItems extends StatelessWidget {
  const BottomNavigationBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126.h,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.fromLTRB(75.w, 36.h, 74.w, 35.h),
        child: Container(
          width: 281.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.redPinkFD5D69,
            borderRadius: BorderRadius.circular(33.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  context.go(Routers.home);
                },
                icon: SvgPicture.asset(AppIcons.home),
              ),
              IconButton(
                onPressed: () {
                  context.push(Routers.community);
                },
                icon: SvgPicture.asset(AppIcons.community),
              ),
              IconButton(
                onPressed: () {
                  context.push(Routers.categoriesPage);
                },
                icon: SvgPicture.asset(AppIcons.categories),
              ),
              IconButton(
                onPressed: () {

                  context.go(Routers.myProfile);
                },
                icon: SvgPicture.asset(AppIcons.profile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
