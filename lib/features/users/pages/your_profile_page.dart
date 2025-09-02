import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
                    padding: EdgeInsets.only(right: 36.w, left: 36.w),
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverAppBar(
                          leading: SizedBox(),
                          pinned: true,
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
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 700.h, // Set a fixed height for the TabBarView
                            child: TabBarView(
                              controller: _controller,
                              children: [
                                CategoryDetailsPageItem(categoryDetails: vm.yourRecipe),
                                Container(
                                  padding: EdgeInsets.all(16.w),
                                  child: Text(
                                    'Favourites Tab Content',
                                    style: AppStyles.s12w400whiteFFFDF9,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
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
