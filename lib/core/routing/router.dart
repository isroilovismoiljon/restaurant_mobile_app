import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/features/auth/pages/enter_send_code_page.dart';
import 'package:restourant_mobile_app/features/auth/pages/forgot_your_password_enter_email_page.dart';
import 'package:restourant_mobile_app/features/auth/pages/login_page.dart';
import 'package:restourant_mobile_app/features/auth/pages/register_page.dart';
import 'package:restourant_mobile_app/features/recipes/pages/community_page.dart';
import 'package:restourant_mobile_app/features/recipes/pages/categories_page.dart';
import 'package:restourant_mobile_app/features/recipes/pages/category_details_page.dart';
import 'package:restourant_mobile_app/features/recipes/pages/recipes_page.dart';
import 'package:restourant_mobile_app/features/onboarding/pages/allergic_page.dart';
import 'package:restourant_mobile_app/features/onboarding/pages/cooking_level_page.dart';
import 'package:restourant_mobile_app/features/onboarding/pages/welcome_page.dart';
import 'package:restourant_mobile_app/features/recipes/pages/trending_recipes_page.dart';
import 'package:restourant_mobile_app/features/recipes/pages/your_recipes_page.dart';
import 'package:restourant_mobile_app/features/reviews/page/create_review_page.dart';
import 'package:restourant_mobile_app/features/settings/pages/settings_page.dart';
import 'package:restourant_mobile_app/features/users/pages/chef_profile_page.dart';
import 'package:restourant_mobile_app/features/users/pages/your_profile_page.dart';
import '../../features/common/widgets/transition/custom_transition_page.dart';
import '../../features/error/error404.dart';
import '../../features/home/pages/home.dart';
import '../../features/onboarding/pages/cuisines_page.dart';
import '../../features/onboarding/pages/launch.dart';
import '../../features/onboarding/pages/onboarding_page.dart';
import '../../features/recipes/pages/create_recipe_page.dart';
import '../../features/reviews/page/reviews_page.dart';
import '../../features/users/pages/top_chefs_page.dart';

GoRouter router = GoRouter(
  initialLocation: Routers.addRecipe,
  routes: <RouteBase>[
    GoRoute(
      path: Routers.launchPage,
      builder: (context, state) => Launch(),
    ),
    GoRoute(
      path: Routers.home,
      pageBuilder: (context, state) => buildPageWithRightToLeftTransition(
        context,
        state,
        const HomePage(),
      ),
    ),
    GoRoute(
      path: Routers.categoriesPage,
      builder: (context, state) => CategoriesPage(),
    ),
    GoRoute(
      path: Routers.categoryDetails,
      builder: (context, state) => CategoryDetails(
        items: state.extra as Map,
      ),
    ),
    GoRoute(
      path: Routers.recipesPage,
      builder: (context, state) => RecipesPage(
        categoryDetail: state.extra as Map,
      ),
    ),
    GoRoute(
      path: Routers.trendingRecipesPage,
      builder: (context, state) => TrendingRecipesPage(),
    ),
    GoRoute(
      path: Routers.cuisinesPage,
      builder: (context, state) => CuisinesPage(),
    ),
    GoRoute(
      path: Routers.allergicPage,
      builder: (context, state) => AllergicPage(),
    ),
    GoRoute(
      path: Routers.error404Page,
      builder: (context, state) => Error404(),
    ),
    GoRoute(
      path: Routers.cookingLevelPage,
      builder: (context, state) => CookingLevelPage(),
    ),
    GoRoute(
      path: Routers.onboarding,
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: Routers.welcomePage,
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: Routers.registerPage,
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: Routers.loginPage,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routers.forgotYourPasswordEnterEmailPage,
      builder: (context, state) => ForgotYourPasswordEnterEmailPage(),
    ),
    GoRoute(
      path: Routers.enterSendCodePage,
      builder: (context, state) => EnterSendCodePage(),
    ),
    GoRoute(
      path: Routers.topChefs,
      builder: (context, state) => TopChefsPage(),
    ),
    GoRoute(
      path: Routers.chefProfile,
      builder: (context, state) => ChefProfilePage(
        chefId: state.extra as int,
      ),
    ),
    GoRoute(
      path: Routers.reviewsPage,
      builder: (context, state) => ReviewsPage(
        recipeId: state.extra as int,
      ),
    ),
    GoRoute(
      path: Routers.createdReviewsPage,
      builder: (context, state) => CreateReviewPage(
        recipeId: state.extra as int,
      ), 
    ),
    GoRoute(
      path: Routers.yourRecipes,
      builder: (context, state) => YourRecipes(), 
    ),
    GoRoute(
      path: Routers.community,
      builder: (context, state) => CommunityPage(), 
    ),
    GoRoute(
      path: Routers.myProfile,
      builder: (context, state) => YourProfilePage(), 
    ),
    GoRoute(
      path: Routers.addRecipe,
      builder: (context, state) => CreateRecipePage(), 
    ),
    GoRoute(
      path: Routers.settings,
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
