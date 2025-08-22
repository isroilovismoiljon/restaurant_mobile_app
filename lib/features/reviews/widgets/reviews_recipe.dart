import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/reviews/managers/reviews_vm.dart';

class ReviewsRecipe extends StatelessWidget {
  const ReviewsRecipe({
    super.key, required this.vm,
  });
  final ReviewsViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 37.w,
        vertical: 30.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.redPinkFD5D69,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: vm.isLoadingRecipe
          ? Center(child: CircularProgressIndicator())
          : Row(
              spacing: 15.w,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.35.r),
                  child: Image.network(
                    vm.recipe!.photo,
                    height: 162.h,
                    width: 162.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 132.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        vm.recipe!.title,
                        style: Styles.s20w500whiteFFFDF9,
                      ),
                      Row(
                        spacing: 7.w,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 4.w,
                            children: [
                              ...List.generate(
                                vm.recipe!.rating.round(),
                                (index) => SvgPicture.asset(
                                  AppIcons.starFilled,
                                ),
                              ),
                              ...List.generate(
                                5 - vm.recipe!.rating.round(),
                                (index) => SvgPicture.asset(
                                  AppIcons.starEmpty,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '(${vm.recipe!.reviewsCount} Reviews)',
                            style: Styles.s12w400whiteFFFDF9,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5.w,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                            child: Image.network(
                              vm.recipe!.chef.profilePhoto,
                              width: 32.w,
                              height: 32.h,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@${vm.recipe!.chef.username}',
                                style: Styles.s13w400whiteFFFDF9,
                              ),
                              Text(
                                '${vm.recipe!.chef.firstName} ${vm.recipe!.chef.firstName}-Chef',
                                style: Styles.s13w300whiteFFFDF9leagueSpartan,
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context.push(Routers.createdReviewsPage, extra: vm.recipe!.id);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.whiteD9D9D9,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                          ),
                        ),
                        child: Text(
                          'Add Review',
                          style: Styles.s15w500redPinkFD5D69,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
