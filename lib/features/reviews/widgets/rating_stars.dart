import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';

class RatingStars extends StatefulWidget {
  final ValueChanged<int> onChanged;
  RatingStars({
    super.key, required this.onChanged,
  });

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {

  int rating = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          5,
          (index) {
            return IconButton(
              onPressed: () {
                rating = index + 2;
                widget.onChanged(rating);
                setState(() {});
              },
              icon: SvgPicture.asset(
                index + 1 < rating ? AppIcons.starFilled : AppIcons.starEmpty,
                width: 29.w,
                height: 29.h,
                colorFilter: ColorFilter.mode(AppColors.redPinkFD5D69, BlendMode.srcIn),
              ),
            );
          },
        ),
      ],
    );
  }
}
