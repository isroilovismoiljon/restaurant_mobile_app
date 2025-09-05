import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/dependencies.dart';
import 'package:restourant_mobile_app/core/routing/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/themes.dart';
import 'package:restourant_mobile_app/features/common/managers/theme_mode_view_model.dart';

import 'data/models/category/category_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final addDocumentDir = await getTemporaryDirectory();
  Hive.init(addDocumentDir.path);
  Hive.registerAdapter(CategoryModelAdapter());
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
