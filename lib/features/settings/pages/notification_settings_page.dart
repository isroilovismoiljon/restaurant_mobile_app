import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/features/common/widgets/app_bar/app_bar_without_actions.dart';
import 'package:restourant_mobile_app/features/common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';

import '../widgets/notification_item.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarWithoutActions(title: 'Notification'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(35.w, 20.h, 36.w, 126.h),
        child: Column(
          children: [
            NotificationItem(
              title: 'General Notification',
            ),
            NotificationItem(
              title: 'Sound',
            ),
            NotificationItem(
              title: 'Sound Call',
            ),
            NotificationItem(
              title: 'Vibrate',
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
