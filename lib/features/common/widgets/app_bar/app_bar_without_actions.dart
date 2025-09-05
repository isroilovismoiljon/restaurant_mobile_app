import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

import 'app_bar_leading_back_arrow.dart';

class AppBarWithoutActions extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWithoutActions({
    super.key,
    required this.title, this.centerTitle = true
  });

  final String title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppBarLeadingBackArrow(
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      leadingWidth: 75.w,
      title: Text(
        title,
        style: AppStyles.s20w600redPink,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56.h);

}
