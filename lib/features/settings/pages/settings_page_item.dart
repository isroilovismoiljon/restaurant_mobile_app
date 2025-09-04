import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class SettingsPageItem extends StatelessWidget {
  const SettingsPageItem({
    super.key,
    required this.title,
    required this.mainIcon,
    this.goNextPage = true,
    required this.onTap,
  });

  final String title;
  final String mainIcon;
  final bool goNextPage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 18.w,
            children: [
              SizedBox(
                width: 35.w,
                height: 35.h,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    mainIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.whiteBeigeFFFDF9,
                      BlendMode.srcIn,
                    ),
                  ),
                  padding: EdgeInsets.all(8.r),
                  style: IconButton.styleFrom(backgroundColor: AppColors.redPinkFD5D69, shape: CircleBorder()),
                ),
              ),
              Text(
                title,
                style: AppStyles.s15w500whiteBeigeFFFDF9,
              ),
            ],
          ),
          if (goNextPage)
            SizedBox(
              height: 22.h,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.playBorder,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
        ],
      ),
    );
  }
}
