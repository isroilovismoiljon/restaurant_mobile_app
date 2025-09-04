import 'package:flutter/material.dart';
import '../../../core/utils/styles.dart';
import '../../recipes/widget/category_details_page_item.dart';
import '../managers/your_profile_vm.dart';

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
  void dispose() {
    controller.dispose();
    super.dispose();
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
        Expanded(
          child: TabBarView(
            controller: controller,
            children: <Widget>[
              // Recipes Tab
              widget.vm.isLoadingYourRecipe
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : widget.vm.errorYourRecipe != null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Failed to load recipes',
                                style: AppStyles.s12w400whiteFFFDF9,
                              ),
                              TextButton(
                                onPressed: () => widget.vm.getYourRecipes(),
                                child: Text(
                                  'Retry',
                                  style: AppStyles.s12w400whiteFFFDF9,
                                ),
                              ),
                            ],
                          ),
                        )
                      : widget.vm.yourRecipe.isEmpty
                          ? Center(
                              child: Text(
                                'No recipes found',
                                style: AppStyles.s12w400whiteFFFDF9,
                              ),
                            )
                          : CategoryDetailsPageItem(
                              categoryDetails: widget.vm.yourRecipe,
                            ),
              // Favourites Tab
              widget.vm.isLoadingFavourite
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : widget.vm.errorFavourite != null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Failed to load favourites',
                                style: AppStyles.s12w400whiteFFFDF9,
                              ),
                              TextButton(
                                onPressed: () => widget.vm.getFavouriteRecipes(),
                                child: Text(
                                  'Retry',
                                  style: AppStyles.s12w400whiteFFFDF9,
                                ),
                              ),
                            ],
                          ),
                        )
                      : widget.vm.favourite.isEmpty
                          ? Center(
                              child: Text(
                                'No favourite recipes found',
                                style: AppStyles.s12w400whiteFFFDF9,
                              ),
                            )
                          : CategoryDetailsPageItem(
                              categoryDetails: widget.vm.favourite,
                            ),
            ],
          ),
        ),
      ],
    );
  }
}
