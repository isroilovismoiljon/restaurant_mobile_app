import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/common/app_bar/my_app_bar.dart';
import 'package:restourant_mobile_app/features/common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:restourant_mobile_app/features/recipes/managers/community_vm.dart';
import 'package:restourant_mobile_app/features/recipes/widget/community_item.dart';

import '../../../data/models/recipes/community_model.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(repository: context.read()),
      builder: (context, child) => Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(categoryTitle: 'Community'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Selector<CommunityViewModel, (bool, List<CommunityModel>)>(
            selector: (context, vm) => (vm.isLoading, vm.communities),
            builder: (context, value, child) {
              final (isLoading, communities) = value;
              return isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
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
                    );
            },
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
