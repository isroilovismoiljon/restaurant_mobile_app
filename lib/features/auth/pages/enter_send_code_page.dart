import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/features/auth/widgets/enter_code_form_fields.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../widgets/forgot_your_password_title_subtitle_widget.dart';

class EnterSendCodePage extends StatefulWidget {
  const EnterSendCodePage({super.key});

  @override
  State<EnterSendCodePage> createState() => _EnterSendCodePageState();
}

class _EnterSendCodePageState extends State<EnterSendCodePage> {
  final focusNodes = List.generate(6, (index) => FocusNode());
  final controllers = List.generate(6, (index) => TextEditingController());
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
          spacing: 53.h,
          children: [
            ForgotYourPasswordTitleSubtitleWidget(
              title: 'You’ve got mail',
              subtitle:
                  'We will send you the verification code to your email address, check your email and put the code right below .',
            ),
            EnterCodeFormFields(
              controllers: controllers,
              focusNodes: focusNodes,),
            Text(
              'Didn’t receive the mail?\nYou can resend it in 49 sec',
              style: AppStyles.s13w400whiteFFFDF9,
              textAlign: TextAlign.center,
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
