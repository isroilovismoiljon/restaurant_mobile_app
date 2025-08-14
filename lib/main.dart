import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/routing/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/data/repositories/auth/register_repository.dart';
import 'package:restourant_mobile_app/data/repositories/recipes/category_details_repo.dart';
import 'package:restourant_mobile_app/data/repositories/recipes/category_repository.dart';
import 'package:restourant_mobile_app/data/repositories/recipes/recipe_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: [
          Provider(create: (context) => ApiClient(baseUrl: "http://192.168.11.205:8888/api/v1")),
          Provider(
            create: (context) => CategoryRepository(client: context.read()),
          ),
          Provider(
            create: (context) => CategoryDetailsRepository(client: context.read()),
          ),
          Provider(
            create: (context) => RecipeRepository(client: context.read()),
          ),
          Provider(
            create: (context) => RegisterRepository(client: context.read()),
          ),
        ],
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: true,
          routerConfig: MyRouter().router,
        ),
      ),
    );
  }
}
