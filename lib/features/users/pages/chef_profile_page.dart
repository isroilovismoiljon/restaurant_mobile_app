import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:restourant_mobile_app/features/users/managers/chef_profile_vm.dart';
import 'package:restourant_mobile_app/features/users/widgets/chef_profile_stats.dart';
import '../../../core/utils/icons.dart';
import '../../common/others/animated_border_container.dart';
import '../../recipes/widget/category_details_page_item.dart';

class ChefProfilePage extends StatelessWidget {
  const ChefProfilePage({super.key, required this.chefId});

  final int chefId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChefProfileViewModel(
        context.read(),
        context.read(),
        client: context.read(),
        id: chefId,
      ),
      child: Consumer<ChefProfileViewModel>(
        builder: (context, vm, child) {
          return vm.isLoadingChef
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  extendBody: true,
                  appBar: MyAppBar(
                    categoryTitle: '@${vm.chef!.username}',
                    centerTitle: false,
                    actions: [AppIcons.share, AppIcons.threeDots],
                    onTapFirstIcon: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: AppColors.whiteBeigeFFFDF9,
                          ),
                          constraints: BoxConstraints(minHeight: 240.h),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 45.w,
                              top: 50.h,
                              right: 56.w,
                            ),
                            child: Column(
                              spacing: 17.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  spacing: 15.w,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(32.r),
                                      child: Image.network(
                                        vm.chef!.profilePhoto,
                                        height: 64.h,
                                        width: 64.w,
                                      ),
                                    ),
                                    Text(
                                      "@${vm.chef!.username}",
                                      style: Styles.s15w500redPinkFD5D69,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Copy Profile URL',
                                  style: Styles.s15w400beigeGradient1C0F0D,
                                ),
                                Text(
                                  'Share this Profile',
                                  style: Styles.s15w400beigeGradient1C0F0D,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    onTapLastIcon: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: AppColors.whiteBeigeFFFDF9,
                          ),
                          constraints: BoxConstraints(minHeight: 100.h),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 45.w,
                              top: 50.h,
                              right: 56.w,
                              bottom: 65.h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 17.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 15.w,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(32.r),
                                      child: Image.network(
                                        vm.chef!.profilePhoto,
                                        height: 64.h,
                                        width: 64.w,
                                      ),
                                    ),
                                    Text(
                                      "@${vm.chef!.username}",
                                      style: Styles.s15w500redPinkFD5D69,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Report',
                                  style: Styles.s15w400beigeGradient1C0F0D,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  backgroundColor: AppColors.backgroundColor,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 37.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 13.h,
                        children: [
                          Row(
                            spacing: 13.w,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Image.network(
                                  vm.chef!.profilePhoto,
                                  width: 102.w,
                                  height: 97.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 205.w,
                                child: Column(
                                  spacing: 6.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${vm.chef!.firstName} ${vm.chef!.lastName}-Chef',
                                      style: Styles.s15w500redPinkFD5D69,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      vm.chef!.presentation!,
                                      style: Styles.s12w300whiteBeigeFFFDF9,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: AppColors.pinkFFC6C9,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 3.h,
                                          horizontal: 17.w,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Following',
                                        style: Styles.s10w500pinkColorEC888D,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AnimatedBorderContainer(
                            child: ChefProfileStats(model: vm.chef!),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Recipes',
                                style: Styles.s12w400whiteFFFDF9,
                                textAlign: TextAlign.center,
                              ),
                              Divider(
                                color: AppColors.redPinkFD5D69,
                                height: 2.h,
                                radius: BorderRadius.circular(2.r),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CategoryDetailsPageItem(
                                categoryDetails: vm.categoryDetails,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: MyBottomNavigationBar(),
                );
        },
      ),
    );
  }
}
