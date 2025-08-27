import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_theme.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/styles.dart';
import '../../common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../../common/others/animated_border_container.dart';
import '../../recipes/widget/category_details_page_item.dart';
import '../managers/your_profile_vm.dart';
import '../widgets/chef_profile_stats.dart';

class YourProfilePage extends StatelessWidget {
  const YourProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourProfileViewModel(
        context.read(),
        context.read(),
        client: context.read(),
      ),
      child: Consumer<YourProfileViewModel>(
        builder: (context, vm, child) {
          return vm.isLoadingUser
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  extendBody: true,
                  backgroundColor: AppColors.backgroundColor,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(right: 36.w, left: 36.w, top: 47.h),
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
                                  vm.user!.profilePhoto,
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
                                      '${vm.user!.firstName} ${vm.user!.lastName}',
                                      style: Styles.s15w500redPinkFD5D69,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "@${vm.user!.username}",
                                      style: Styles.s12w400pinkColorEC888D,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      vm.user!.presentation!,
                                      style: Styles.s12w300whiteBeigeFFFDF9,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: ColorScheme.of(context).secondary,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  fixedSize: Size(175.w, 27.h),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero
                                ),
                                child: Text(
                                  'Edit Profile',
                                  style: Styles.s15w500pinkEC888D,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: ColorScheme.of(context).secondary,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    fixedSize: Size(175.w, 27.h),
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero
                                ),
                                child: Text(
                                  'Share Profile',
                                  style: Styles.s15w500pinkEC888D,
                                ),
                              ),
                            ],
                          ),
                          AnimatedBorderContainer(
                            child: ChefProfileStats(model: vm.user!),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    spacing: 2.h,
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
                                    ],
                                  ),
                                  Column(
                                    spacing: 2.h,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Favourites',
                                        style: Styles.s12w400whiteFFFDF9,
                                        textAlign: TextAlign.center,
                                      ),
                                      Divider(
                                        color: AppColors.redPinkFD5D69,
                                        height: 2.h,
                                        radius: BorderRadius.circular(2.r),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CategoryDetailsPageItem(
                                categoryDetails: vm.yourRecipe,
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
