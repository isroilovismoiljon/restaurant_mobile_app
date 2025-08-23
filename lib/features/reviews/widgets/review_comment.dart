import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/time/time_helper.dart';
import 'package:restourant_mobile_app/features/reviews/managers/reviews_vm.dart';

class ReviewComment extends StatelessWidget {
  const ReviewComment({
    super.key, required this.vm, required this.index,
  });

  final ReviewsViewModel vm;
  final int index;


  @override
  Widget build(BuildContext context) {
    final String? profilePhoto = vm.reviews[index].user!.profilePhoto;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 13.w,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    22.r,
                  ),
                  child: profilePhoto == null || profilePhoto.isEmpty
                      ? Image.network(
                          'https://riki.dotabuff.com/t/l/JejpeHjfDR.png',
                          width: 44.w,
                          height: 44.h,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          vm.reviews[index].user!.profilePhoto,
                          width: 44.w,
                          height: 44.h,
                          fit: BoxFit.cover,
                        ),
                ),
                Text(
                  '@${vm.reviews[index].user!.username}',
                  style: Styles.s15w400redPinkFD5D69poppins,
                ),
              ],
            ),
            Text(
              "(${TimeHelper.timeAgo(vm.reviews[index].created!)})",
              style: Styles.s12w400pinkColorEC888D,
            ),
          ],
        ),
        Text(
          vm.reviews[index].comment,
          style: Styles.s12w300whiteBeigeFFFDF9,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          width: 142.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                vm.reviews[index].rating.round(),
                (index) {
                  return SvgPicture.asset(
                    AppIcons.star,
                    colorFilter: ColorFilter.mode(
                      AppColors.redPinkFD5D69,
                      BlendMode.srcIn,
                    ),
                  );
                },
              ),
              ...List.generate(
                5 - vm.reviews[index].rating.round(),
                (index) {
                  return SvgPicture.asset(
                    AppIcons.starEmpty,
                    colorFilter: ColorFilter.mode(
                      AppColors.redPinkFD5D69,
                      BlendMode.srcIn,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
