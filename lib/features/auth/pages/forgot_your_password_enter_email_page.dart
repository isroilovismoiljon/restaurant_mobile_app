import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/features/auth/widgets/forgot_your_password_title_subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';

class ForgotYourPasswordEnterEmailPage extends StatelessWidget {
  ForgotYourPasswordEnterEmailPage({super.key});

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Forgot Your Password",
          style: AppStyles.s20w600redPink,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 45.h),
        child: Column(
          spacing: 43.h,
          children: [
            ForgotYourPasswordTitleSubtitleWidget(
              title: "Hello There!",
              subtitle:
                  "Enter your email address. We will send a code verification in the next step.",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3.h,
              children: [
                Text(
                  'Email',
                  style: AppStyles.s15w500whiteBeigeFFFDF9,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'example@example.com',
                    hintStyle: AppStyles.s16w500gray727c9c,
                    filled: true,
                    fillColor: AppColors.pinkFFC6C9,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 112.w),
        child: ToNextPageButton(
          title: "Continue",
          onPressed: () {
            context.push(Routers.enterSendCodePage);
          },
          buttonBackgroundColor: AppColors.pinkFFC6C9,
          buttonTextStyle: AppStyles.s20w600pinkEC888D,
        ),
      ),
    );
  }
}
