import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/client.dart';
import 'package:restourant_mobile_app/core/routing/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/data/repositories/authentication_repository.dart';
import 'package:restourant_mobile_app/data/repositories/recipe_repository.dart';

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
          Provider(
            create: (context) =>
                ApiClient(baseUrl: "http://192.168.0.106:8888/api/v1"),
          ),
          Provider(
            create: (context) => RecipeRepository(client: context.read()),
          ),
          Provider(
            create: (context) =>
                AuthenticationRepository(client: context.read()),
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
