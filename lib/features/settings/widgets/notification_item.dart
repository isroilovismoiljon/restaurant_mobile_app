import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key, required this.title});

  final String title;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool generalSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: AppStyles.s15w500whiteBeigeFFFDF9,
        ),
        Transform.scale(
          scale: 0.7.r,
          child: Switch(
            value: generalSwitch,
            onChanged: (bool value) {
              setState(() {
                generalSwitch = value;
              });
            },
            focusColor: AppColors.redPinkFD5D69,
          ),
        ),
      ],
    );
  }
}
