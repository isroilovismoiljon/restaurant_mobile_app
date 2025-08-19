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
    this.centerTitle = true,
    this.onTapFirstIcon = _defaultOnTap,
    this.onTapLastIcon = _defaultOnTap,
  });

  static void _defaultOnTap(){}

  final String categoryTitle;
  final List<String> actions;
  final bool centerTitle;
  final VoidCallback onTapFirstIcon;
  final VoidCallback onTapLastIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      leading: AppBarLeadingBackArrow(
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      leadingWidth: 75.w,
      title: Text(
        categoryTitle,
        style: Styles.s20w600redPink,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: centerTitle,
      actions:
      actions.isEmpty
      ? null
      : [
        Row(
          children: [
            GestureDetector(
              onTap: onTapFirstIcon,
              child: AppBarAction(
                icon: actions.isNotEmpty ? actions[0] : AppIcons.notification,
              ),
            ),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: onTapLastIcon,
              child: AppBarAction(
                icon: actions.length > 1 ? actions[1] : AppIcons.search,
              ),
            ),
          ],
        ),
        SizedBox(width: 37.w),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
