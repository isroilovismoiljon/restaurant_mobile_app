import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/app_bar_action.dart';
import 'package:restourant_mobile_app/features/common/app_bar/app_bar_leading_back_arrow.dart';

import '../../../core/utils/icons.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.categoryTitle,
    this.actions = const [],
  });

  final String categoryTitle;
  final List<String> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      leading: AppBarLeadingBackArrow(onPressed: () {Navigator.of(context).pop();  },),
      leadingWidth: 100.w,
      title: Text(categoryTitle, style: Styles.s20w600redPink),
      centerTitle: true,
      actions: [
        Row(
          children: [
            AppBarAction(
              icon: actions.isNotEmpty
                  ? actions[0]
                  : AppIcons.notification,
            ),
            SizedBox(width: 5.w),
            AppBarAction(
              icon: actions.length > 1
                  ? actions[1]
                  : AppIcons.search,
            ),
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
