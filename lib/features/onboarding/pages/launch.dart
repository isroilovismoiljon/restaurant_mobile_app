import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import '../../../core/routing/routes.dart';

class Launch extends StatefulWidget {
  const Launch({super.key});


  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(Routers.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redPinkFD5D69,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Images/Launch/fork-spoon.png',
                width: 153.w,
            ),
            Text('DishDash', style: AppStyles.s64w600whiteFFFDF9,)
          ],
        ),
      ),
    );
  }
}
