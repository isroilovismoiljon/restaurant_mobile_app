import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
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
      create: (context) => HomeViewModel(context.read(), context.read()),
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return Scaffold(
              extendBody: true,
              backgroundColor: AppColors.backgroundBeigeGradient1C0F0D,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundBeigeGradient1C0F0D,
                leading: null,
                title: Padding(
                  padding: EdgeInsets.fromLTRB(19.w, 19.h, 0.w, 20.h),
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
                    padding: EdgeInsets.only(right: 38.w),
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
                    padding: EdgeInsets.only(left: 36.w, right: 36.w),
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
                        padding: EdgeInsets.only(bottom: 125.h, top: 19.h),
                        child: Column(
                          spacing: 19.h,
                          children: [
                            vm.isLoadingTrendingRecipe
                                ? CircularProgressIndicator()
                                : vm.errorTrendingRecipe != null
                                ? Center(
                                    child: Text(vm.errorTrendingRecipe!),
                                  )
                                : GestureDetector(
                                onTap: (){
                                  context.push(Routers.trendingRecipesPage);
                                },
                                  child: TrendingRecipeWidget(
                                      vm: vm,
                                    ),
                                ),
                            GestureDetector(
                              onTap: (){
                                context.push(Routers.yourRecipes);
                              },
                              child: YourRecipesWidget(
                                vm: vm,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.w),
                              child: Column(
                                spacing: 10.h,
                                children: [
                                  TopChefsWidget(
                                    chefs: vm.chefs,
                                    vm: vm,
                                  ),
                                  RecentlyAddedWidget(
                                    recentlyAddedRecipe: vm.recentlyRecipes,
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
