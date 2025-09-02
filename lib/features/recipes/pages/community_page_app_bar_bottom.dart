import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class CommunityPageAppBarBottom extends StatefulWidget {
  const CommunityPageAppBarBottom({
    super.key,
  });

  @override
  State<CommunityPageAppBarBottom> createState() => _CommunityPageAppBarBottomState();
}

class _CommunityPageAppBarBottomState extends State<CommunityPageAppBarBottom> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
            height: 25.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: AppColors.redPinkFD5D69,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Text(
              'Top Recipes',
              style: AppStyles.s16w400white,
            ),
          ),
        ),
        Container(
          height: 25.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Text(
            'Newest',
            style: AppStyles.s16w400redPink,
          ),
        ),
        Container(
          height: 25.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Text(
            'Oldest',
            style: AppStyles.s16w400redPink,
          ),
        ),
      ],
    );
  }
}
