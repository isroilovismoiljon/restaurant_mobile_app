import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/reviews/managers/reviews_vm.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.recipeId});

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(recipeId: recipeId, repository: context.read()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(
          categoryTitle: 'Reviews',
          actions: [],
        ),
        body: Consumer<ReviewsViewModel>(
          builder: (context, vm, child) {
            return Column(
              children: [
                SizedBox(
                  height: 17.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 37.w,
                    vertical: 30.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.redPinkFD5D69,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: vm.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Row(
                          spacing: 15.w,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.35.r),
                              child: Image.network(
                                vm.reviewModel!.photo,
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
                                    vm.reviewModel!.title,
                                    style: Styles.s20w500whiteFFFDF9,
                                  ),
                                  Row(
                                    spacing: 7.w,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ...List.generate(
                                            vm.reviewModel!.rating.round(),
                                            (index) => SvgPicture.asset(
                                              AppIcons.starFilled,
                                            ),
                                          ),
                                          ...List.generate(
                                            5 - vm.reviewModel!.rating.round(),
                                            (index) => SvgPicture.asset(
                                              AppIcons.starEmpty,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '(${vm.reviewModel!.reviewsCount} Reviews)',
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
                                          vm.reviewModel!.chef.profilePhoto,
                                          width: 32.w,
                                          height: 32.h,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '@${vm.reviewModel!.chef.username}',
                                            style: Styles.s13w400whiteFFFDF9,
                                          ),
                                          Text(
                                            '${vm.reviewModel!.chef.firstName} ${vm.reviewModel!.chef.firstName}-Chef',
                                            style: Styles.s13w300whiteFFFDF9leagueSpartan,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 27.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 17.h,
                    children: [
                      Text(
                        'Comments',
                        style: Styles.s15w500redPinkFD5D69,
                      ),
                      vm.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                            children: [
                              Column(
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
                                            child: Image.network(
                                              'https://avatars.mds.yandex.net/get-yapic/43978/yOndxUXWde4hxoGuSyBr6VVeLWs-1/orig',
                                              width: 44.w,
                                              height: 44.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            '@r_joshua',
                                            style: Styles.s15w400redPinkFD5D69poppins,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '(15 mins ago)',
                                        style: Styles.s12w400redPinkFD5D69,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fringilla eleifend purus vel dignissim. Praesent urna ante, iaculis at lobortis eu.',
                                    style: Styles.s12w300whiteBeigeFFFDF9,
                                  ),
                                  SizedBox(
                                    width: 142.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...List.generate(
                                          vm.reviewModel!.rating.round(),
                                          (index) {
                                            return SvgPicture.asset(
                                              AppIcons.star,
                                              colorFilter: ColorFilter.mode(AppColors.redPinkFD5D69, BlendMode.srcIn),
                                            );
                                          },
                                        ),
                                        ...List.generate(
                                          5 - vm.reviewModel!.rating.round(),
                                          (index) {
                                            return SvgPicture.asset(
                                              AppIcons.starEmpty,
                                              colorFilter: ColorFilter.mode(AppColors.redPinkFD5D69, BlendMode.srcIn),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: AppColors.pinkColorEC888D,
                              ),
                            ],
                          ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
