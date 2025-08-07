import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/router/routes.dart';
import 'package:restourant_mobile_app/features/categories/pages/categories_page.dart';
import 'package:restourant_mobile_app/features/categories/pages/category_details.dart';
import 'package:restourant_mobile_app/features/categories/pages/recipes_page.dart';
import 'package:restourant_mobile_app/features/onboarding/pages/cooking_level_page.dart';
import '../../features/error/error404.dart';
import '../../features/onboarding/pages/cuisines_page.dart';

class MyRouter {
  GoRouter router = GoRouter(
    initialLocation: Routers.categoriesPage,
    routes: <RouteBase>[
      GoRoute(
        path: Routers.categoriesPage,
        builder: (context, state) => CategoriesPage(),
      ),
      GoRoute(
        path: Routers.categoryDetails,
        builder: (context, state) => CategoryDetails(items: state.extra as Map,),
      ),
      GoRoute(
        path: Routers.recipesPage,
        builder: (context, state) => RecipesPage(categoryDetail: state.extra as Map,),
      ),
      GoRoute(
        path: Routers.cuisinesPage,
        builder: (context, state) => CuisinesPage(),
      ),
      GoRoute(path: Routers.error404Page,
      builder: (context, state) => Error404(),
      ),
      GoRoute(path: Routers.cookingLevelPage,
      builder: (context, state) => CookingLevelPage(),
      ),
    ],
  );
}
