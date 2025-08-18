import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import '../../common/app_bar/app_bar_action.dart';
import '../../common/app_bar/app_bar_bottom_item.dart';
import '../../common/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../managers/home_vm.dart';
import '../widgets/bw_recently_added_widget.dart';
import '../widgets/bw_top_chefs_widget.dart';
import '../widgets/bw_trending_recipe_widget.dart';
import '../widgets/bw_your_recipes_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            final recentlyAddedRecipe = vm.recentlyRecipes;
            final chefs = vm.chefs;
            return Scaffold(
              extendBody: true,
              backgroundColor: AppColors.backgroundBeigeGradient1C0F0D,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundBeigeGradient1C0F0D,
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(19, 19, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi! Dianne',
                        style: Styles.s25w400redPinkFD5D69,
                      ),
                      Text(
                        'What are you cooking today',
                        style: Styles.s13w400whiteFFFDF9,
                      ),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 38),
                    child: Row(
                      spacing: 5.w,
                      children: [
                        AppBarAction(
                          icon: AppIcons.notification,
                        ),
                        AppBarAction(
                          icon: AppIcons.search,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 36, right: 36),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: vm.isLoadingCategories
                          ? CircularProgressIndicator()
                          : AppBarBottomItem(vm: vm),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 125, top: 19),
                        child: Column(
                          spacing: 19.h,
                          children: [
                            vm.isLoadingTrendingRecipe
                                ? CircularProgressIndicator()
                                : vm.errorTrendingRecipe.length > 0
                                ? Center(
                                    child: Text(vm.errorTrendingRecipe),
                                  )
                                : TrendingRecipeWidget(
                                    vm: vm,
                                  ),
                            YourRecipesWidget(
                              vm: vm,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                              child: Column(
                                spacing: 19.h,
                                children: [
                                  TopChefsWidget(
                                    chefs: chefs,
                                    vm: vm,
                                  ),
                                  RecentlyAddedWidget(
                                    recentlyAddedRecipe: recentlyAddedRecipe,
                                    vm: vm,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: MyBottomNavigationBar(),
            );
          },
        );
      },
    );
  }
}
