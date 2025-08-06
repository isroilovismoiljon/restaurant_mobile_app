import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/app_bar_action.dart';

import '../../../core/utils/icons.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: SvgPicture.asset(AppIcons.backArrow),
      ),
      leadingWidth: 100.w,
      title: Text(categoryTitle, style: Styles.s20w600redPink),
      centerTitle: true,
      actions: [
        Row(
          spacing: 5,
          children: [
            AppBarAction(icon: AppIcons.notification),
            AppBarAction(icon: AppIcons.search),
          ],
        ),
        SizedBox(width: 37.w),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);
}
