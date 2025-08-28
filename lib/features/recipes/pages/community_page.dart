import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:restourant_mobile_app/features/recipes/managers/community_vm.dart';
import 'package:restourant_mobile_app/features/recipes/widget/community_item.dart';
import '../../../core/utils/styles.dart';
import '../../../data/models/recipes/community_model.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int appbarBottomIndex = 0;
  int bottomTopIndex = 0;
  int bottomNewIndex = 1;
  int bottomOldIndex = 2;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(repository: context.read()),
      builder: (context, child) => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(categoryTitle: 'Community'),
        body: Column(
          spacing: 22.h,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      appbarBottomIndex = bottomTopIndex;
                      var vm = context.read<CommunityViewModel>().getTopCommunities();
                      setState(() {});
                    },
                    child: Container(
                      height: 25.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: appbarBottomIndex == bottomTopIndex ? AppColors.redPinkFD5D69 : Colors.transparent,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Text(
                        'Top Recipes',
                        style: appbarBottomIndex == bottomTopIndex ? Styles.s16w400white : Styles.s16w400redPink,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      appbarBottomIndex = bottomNewIndex;
                      var vm = context.read<CommunityViewModel>().getNewCommunities();
                      setState(() {});
                    },
                    child: Container(
                      height: 25.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: appbarBottomIndex == bottomNewIndex ? AppColors.redPinkFD5D69 : Colors.transparent,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Text(
                        'Newest',
                        style: appbarBottomIndex == bottomNewIndex ? Styles.s16w400white : Styles.s16w400redPink,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                        appbarBottomIndex = bottomTopIndex;
                        var vm = context.read<CommunityViewModel>().getOldCommunities();
                        setState(() {});
                      appbarBottomIndex = bottomOldIndex;
                      setState(() {});
                    },
                    child: Container(
                      height: 25.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: appbarBottomIndex == bottomOldIndex ? AppColors.redPinkFD5D69 : Colors.transparent,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Text(
                        'Oldest',
                        style: appbarBottomIndex == bottomOldIndex ? Styles.s16w400white : Styles.s16w400redPink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Selector<CommunityViewModel, (bool, List<CommunityModel>)>(
                selector: (context, vm) => (vm.isLoading, vm.communities),
                builder: (context, value, child) {
                  final (isLoading, communities) = value;
                  return isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 125.h),
                            child: Column(
                              spacing: 34.h,
                              children: [
                                ...List.generate(
                                  communities.length,
                                  (index) {
                                    return CommunityItem(community: communities[index]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
