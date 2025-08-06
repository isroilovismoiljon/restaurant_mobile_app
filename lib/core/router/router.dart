import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/router/routes.dart';
import 'package:restourant_mobile_app/features/categories/pages/categories_page.dart';
import 'package:restourant_mobile_app/features/categories/pages/category_details.dart';

class MyRouter {
  GoRouter router = GoRouter(
    initialLocation: '/categories_page',
    routes: <RouteBase>[
      GoRoute(
        path: Routers.categoriesPage,
        builder: (context, state) => CategoriesPage(),
      ),
      GoRoute(
        path: Routers.categoryDetails,
        builder: (context, state) => CategoryDetails(items: state.extra as Map,),
      ),
    ],
  );
}
