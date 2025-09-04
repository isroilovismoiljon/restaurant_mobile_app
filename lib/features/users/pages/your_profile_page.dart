import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/features/recipes/widget/category_details_page_item.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../common/widgets/border/animated_border_container.dart';
import '../../common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../managers/your_profile_vm.dart';
import '../widgets/chef_profile_stats.dart';

class YourProfilePage extends StatefulWidget {
  const YourProfilePage({Key? key}) : super(key: key);

  @override
  State<YourProfilePage> createState() => _YourProfilePageState();
}

class _YourProfilePageState extends State<YourProfilePage> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  body: Padding(
                    padding: EdgeInsets.only(right: 36.w, left: 36.w, bottom: 126.h),
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverAppBar(
                          leading: SizedBox(),
                          surfaceTintColor: Colors.transparent,
                          leadingWidth: 0,
                          titleSpacing: 0,
                          toolbarHeight: 220.h,
                          title: Padding(
                            padding: EdgeInsets.zero,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 13.h,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  spacing: 13.h,
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
                                      width: 241.w,
                                      height: 97.h,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              spacing: 6.h,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${vm.user!.firstName} ${vm.user!.lastName}',
                                                  style: AppStyles.s15w500redPinkFD5D69,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  "@${vm.user!.username}",
                                                  style: AppStyles.s12w400pinkColorEC888D,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  vm.user!.presentation!,
                                                  style: AppStyles.s12w300whiteBeigeFFFDF9,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Row(
                                              spacing: 5.w,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 28.w,
                                                  height: 28.h,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      context.push(Routers.addRecipe);
                                                    },
                                                    icon: SvgPicture.asset(
                                                      AppIcons.plus,
                                                    ),
                                                    color: AppColors.pinkFFC6C9,
                                                    padding: EdgeInsets.all(7.r),
                                                    style: IconButton.styleFrom(
                                                      shape: CircleBorder(),
                                                      backgroundColor: AppColors.pinkFFC6C9,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 28.w,
                                                  height: 28.h,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      context.push(Routers.settings);
                                                    },
                                                    padding: EdgeInsets.all(8.r),
                                                    icon: SvgPicture.asset(
                                                      AppIcons.threeLine,
                                                    ),
                                                    style: IconButton.styleFrom(
                                                      shape: CircleBorder(),
                                                      backgroundColor: AppColors.pinkFFC6C9,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Text(
                                        'Edit Profile',
                                        style: AppStyles.s15w500pinkEC888D,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: ColorScheme.of(context).secondary,
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        fixedSize: Size(175.w, 27.h),
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Text(
                                        'Share Profile',
                                        style: AppStyles.s15w500pinkEC888D,
                                      ),
                                    ),
                                  ],
                                ),
                                AnimatedBorderContainer(
                                  child: ChefProfileStats(model: vm.user!),
                                ),
                              ],
                            ),
                          ),
                          bottom: TabBar(
                            dividerColor: Colors.transparent,
                            controller: _controller,
                            tabs: [
                              Tab(
                                child: Text(
                                  'Recipes',
                                  style: AppStyles.s12w400whiteFFFDF9,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Favourites',
                                  style: AppStyles.s12w400whiteFFFDF9,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverFillRemaining(
                          child: TabBarView(
                            controller: _controller,
                            children: [
                              // Recipes Tab
                              vm.isLoadingYourRecipe
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : vm.errorYourRecipe != null
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Failed to load recipes',
                                            style: AppStyles.s15w500redPinkFD5D69,
                                          ),
                                          SizedBox(height: 10.h),
                                          TextButton(
                                            onPressed: () => vm.getYourRecipes(),
                                            child: Text(
                                              'Retry',
                                              style: AppStyles.s12w400whiteFFFDF9,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : vm.yourRecipe.isEmpty
                                  ? Center(
                                      child: Text(
                                        'No recipes found',
                                        style: AppStyles.s15w500redPinkFD5D69,
                                      ),
                                    )
                                  : CategoryDetailsPageItem(categoryDetails: vm.yourRecipe),
                              // Favourites Tab
                              vm.isLoadingFavourite
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : vm.errorFavourite != null
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Failed to load favourites',
                                            style: AppStyles.s15w500redPinkFD5D69,
                                          ),
                                          SizedBox(height: 10.h),
                                          TextButton(
                                            onPressed: () => vm.getFavouriteRecipes(),
                                            child: Text(
                                              'Retry',
                                              style: AppStyles.s12w400whiteFFFDF9,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : vm.favourite.isEmpty
                                  ? Center(
                                      child: Text(
                                        'No favourite recipes found',
                                        style: AppStyles.s15w500redPinkFD5D69,
                                      ),
                                    )
                                  : CategoryDetailsPageItem(
                                      categoryDetails: vm.favourite,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: MyBottomNavigationBar(),
                );
        },
      ),
    );
  }
}
