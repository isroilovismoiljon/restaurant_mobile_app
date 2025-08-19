import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class ForgotYourPasswordTitleSubtitleWidget extends StatelessWidget {
  const ForgotYourPasswordTitleSubtitleWidget({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20.h,
      children: [
        Text(
          title,
          style: Styles.s20w600whiteFFFDF9,
        ),
        Text(
          subtitle,
          style: Styles.s13w400whiteFFFDF9,
        ),
      ],
    );
  }
}
