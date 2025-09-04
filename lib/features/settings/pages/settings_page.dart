import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/core/utils/theme_mode_view_model.dart';
import 'package:restourant_mobile_app/features/common/widgets/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/settings/pages/settings_page_item.dart';

import '../../common/widgets/app_bar/app_bar_leading_back_arrow.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeadingBackArrow(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        leadingWidth: 75.w,
        title: Text(
          'Settings',
          style: AppStyles.s20w600redPink,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 126.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.h,
          children: [
            SettingsPageItem(
              title: 'Notification',
              mainIcon: AppIcons.notification,
              onTap: () {},
            ),
            SettingsPageItem(
              title: 'Help Center',
              mainIcon: AppIcons.help,
              onTap: () {},
            ),
            SettingsPageItem(
              title: 'Privacy Policy',
              mainIcon: AppIcons.privacyPolicy,
              onTap: () {},
            ),
            SettingsPageItem(
              title: 'Language',
              mainIcon: AppIcons.reviews,
              onTap: () {},
            ),
            SettingsPageItem(
              title: 'Turn dark Theme',
              mainIcon: AppIcons.reload,
              onTap: () {
                ThemeModeViewModel().toggleTheme();
              },
              goNextPage: false,
            ),
            SettingsPageItem(
              title: 'Log Out',
              mainIcon: AppIcons.logout,
              onTap: () {},
              goNextPage: false,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Delete Account',
                style: AppStyles.s15w500pinkEC888D,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
