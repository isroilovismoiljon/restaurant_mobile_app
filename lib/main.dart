import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/core/router/router.dart';
import 'package:restourant_mobile_app/features/categories/pages/category_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/categories/pages/categories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: true,
        routerConfig: MyRouter().router,
      ),
    );
  }
}
