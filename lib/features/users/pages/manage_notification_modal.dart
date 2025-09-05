import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';

import '../../common/widgets/app_bar/app_bar_leading_back_arrow.dart';

class ManageNotificationModal extends StatefulWidget {
  const ManageNotificationModal({
    super.key,
  });

  @override
  State<ManageNotificationModal> createState() => _ManageNotificationModalState();
}

class _ManageNotificationModalState extends State<ManageNotificationModal> {
  bool notificationValue = true;
  bool blockAccountValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
        color: AppColors.whiteBeigeFFFDF9,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
        child: Column(
          spacing: 17.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 15.w,
              children: [
                ClipOval(
                  child: Image.network(
                    width: 64.w,
                    height: 64.h,
                    'https://i.pinimg.com/originals/88/6f/ea/886feade1e6310394b642068e4a1043d.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '@username',
                  style: AppStyles.s15w500redPinkFD5D69,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Text(
              'Manage notifications',
              style: AppStyles.s15w500black,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: AppStyles.s15w400beigeGradient1C0F0D,
                    ),
                    Transform.scale(
                      scale: 0.7.r,
                      child: Switch(
                        padding: EdgeInsets.zero,
                        value: notificationValue,
                        focusColor: AppColors.redPinkFD5D69,
                        onChanged: (bool value) {
                          setState(() {
                            notificationValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Block Account',
                      style: AppStyles.s15w400beigeGradient1C0F0D,
                    ),
                    Transform.scale(
                      scale: 0.7.r,
                      child: Switch(
                        padding: EdgeInsets.zero,
                        value: blockAccountValue,
                        focusColor: AppColors.redPinkFD5D69,
                        onChanged: (bool value) {
                          setState(() {
                            blockAccountValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: (){},
              child: Text(
                'Report',
                style: AppStyles.s15w400beigeGradient1C0F0D,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
