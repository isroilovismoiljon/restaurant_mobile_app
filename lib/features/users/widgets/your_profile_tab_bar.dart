import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../../common/border/animated_border_container.dart';
import '../../recipes/widget/category_details_page_item.dart';
import '../managers/your_profile_vm.dart';
import 'chef_profile_stats.dart';

class YourProfileTabBar extends StatefulWidget {
  YourProfileTabBar({
    super.key, required this.vm,
  });
  final YourProfileViewModel vm;

  @override
  State<YourProfileTabBar> createState() => _YourProfileTabBarState();
}

class _YourProfileTabBarState extends State<YourProfileTabBar> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          controller: controller,
          tabs: [
            Tab(
              child: Text(
                'Recipes',
                style: Styles.s12w400whiteFFFDF9,
                textAlign: TextAlign.center,
              ),
            ),
            Tab(
              child: Text(
                'Favourites',
                style: Styles.s12w400whiteFFFDF9,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        TabBarView(
          controller: controller,
          children: <Widget>[
            widget.vm.isLoadingYourRecipe
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CategoryDetailsPageItem(
                    categoryDetails: widget.vm.yourRecipe,
                  ),
            widget.vm.isLoadingFavourite
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CategoryDetailsPageItem(
                    categoryDetails: widget.vm.favourite,
                  ),
          ],
        ),
      ],
    );
  }
}
