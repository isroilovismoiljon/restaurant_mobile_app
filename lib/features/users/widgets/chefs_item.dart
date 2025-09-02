import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/data/models/users/chef.dart';
import 'package:restourant_mobile_app/features/users/managers/chef_profile_vm.dart';

class ChefsItem extends StatelessWidget {
  const ChefsItem({
    super.key,
    required this.index,
    required this.chefModel,
  });

  final List<ChefModel> chefModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routers.chefProfile, extra: chefModel[index].id);
      },
      child: SizedBox(
        height: 226.h,
        width: 170.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.fromLTRB(10.w, 12.h, 10.w, 10.h),
                width: 160.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteBeigeFFFDF9,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      14.r,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${chefModel[index].firstName}-Chef",
                      style: AppStyles.s12w400brown3E2823,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "@${chefModel[index].username}",
                      style: AppStyles.s12w300redPinkFD5D69,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 3.w,
                          children: [
                            Text(
                              "6687",
                              style: AppStyles.s12w400pinkColorEC888D,
                            ),
                            SvgPicture.asset(
                              AppIcons.star,
                            ),
                          ],
                        ),
                        Row(
                          spacing: 3.w,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.redPinkFD5D69,
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 3.w,
                                ),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Follow',
                                style: AppStyles.s8w500whiteFFFDF9,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},

                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.redPinkFD5D69,
                                padding: EdgeInsets.symmetric(
                                  vertical: 3.h,
                                  horizontal: 3.w,
                                ),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: SvgPicture.asset(
                                AppIcons.share,
                                width: 8.w,
                                height: 9.h,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2.r,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.network(
                    chefModel[index].profilePhoto,
                    height: 153.h,
                    width: 170.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
