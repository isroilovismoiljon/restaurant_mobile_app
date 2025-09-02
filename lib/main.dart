import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/dependencies.dart';
import 'package:restourant_mobile_app/core/routing/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/themes.dart';
import 'package:restourant_mobile_app/features/common/managers/theme_mode_view_model.dart';

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
        providers: dependencies,
        builder: (context, child) => MaterialApp.router(
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: context.watch<ThemeModeViewModel>().mode,
          debugShowCheckedModeBanner: true,
          routerConfig: router,
        ),
      ),
    );
  }
}
