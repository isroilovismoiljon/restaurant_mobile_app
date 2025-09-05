import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:restourant_mobile_app/features/users/pages/manage_notification_modal.dart';

import '../../common/widgets/app_bar/app_bar_leading_back_arrow.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> with SingleTickerProviderStateMixin {
  late final TabController _controller;
  final _searchController = SearchController();

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: AppBarLeadingBackArrow(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        leadingWidth: 75.w,
        title: Text(
          '@dianne_r',
          style: AppStyles.s20w600redPink,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: _controller,
          dividerColor: Colors.transparent,
          tabs: [
            Text(
              '125 Following',
              style: AppStyles.s12w400whiteFFFDF9,
            ),
            Text(
              '257 Followers',
              style: AppStyles.s12w400whiteFFFDF9,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 126.h),
        child: Column(
          spacing: 10.h,
          children: [
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: TextField(
                maxLines: 1,
                controller: _searchController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
                  constraints: BoxConstraints(maxHeight: 34.h),
                  fillColor: AppColors.pinkFFC6C9,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: AppStyles.s12w400redPinkFD5D69,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(31.r),
                              child: Image.network(
                                'https://wallpapers.com/images/hd/bmw-tablet-wallpaper-rm7fnf3y167jw89f.jpg',
                                height: 62.h,
                                width: 62.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '@username',
                                  style: AppStyles.s12w400redPinkFD5D69,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Full Name-Chef',
                                  style: AppStyles.s13w400whiteFFFDF9,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.pinkFFC6C9,
                                fixedSize: Size(110.w, 23.h),
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              child: Text('Following', style: AppStyles.s15w500pinkEC888D),
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
                                        color: AppColors.whiteBeigeFFFDF9,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          spacing: 17.h,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              spacing: 15.w,
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    width: 64.w,
                                                    height: 64.h,
                                                    'https://i.pinimg.com/originals/88/6f/ea/886feade1e6310394b642068e4a1043d.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  '@username',
                                                  style: AppStyles.s15w500redPinkFD5D69,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return ManageNotificationModal();
                                                  },
                                                );
                                              },
                                              child: Text(
                                                'Manage notifications',
                                                style: AppStyles.s15w400beigeGradient1C0F0D,
                                              ),
                                            ),
                                            GestureDetector(
                                              child: Text(
                                                'Mute notifications',
                                                style: AppStyles.s15w400beigeGradient1C0F0D,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: SvgPicture.asset(
                                AppIcons.threeDots,
                                colorFilter: ColorFilter.mode(
                                  AppColors.redPinkFD5D69,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(31.r),
                              child: Image.network(
                                'https://wallpapers.com/images/hd/bmw-tablet-wallpaper-rm7fnf3y167jw89f.jpg',
                                height: 62.h,
                                width: 62.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
                              width: 136.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@username',
                                    style: AppStyles.s12w400redPinkFD5D69,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    'Full Name',
                                    style: AppStyles.s13w400whiteFFFDF9,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Following',
                              style: AppStyles.s14w300redPinkFD5D69,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.pinkFFC6C9,
                                fixedSize: Size(69.w, 23.h),
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              child: Text('Delete', style: AppStyles.s15w500pinkEC888D),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
