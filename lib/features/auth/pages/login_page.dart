import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/data/models/auth/login_model.dart';
import 'package:restourant_mobile_app/features/auth/managers/login_vm.dart';
import 'package:restourant_mobile_app/features/auth/widgets/custom_text_field.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';
import '../../../core/utils/styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(repository: context.read()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text("Login", style: Styles.s20w600redPinkFD5D69),
          centerTitle: true,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(top: 140.h, left: 37.w, right: 36.w),
          child: Consumer<LoginViewModel>(
            builder: (context, vm, child) {
              return Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'Email',
                    hint: 'example@example.com',
                    controller: emailController,
                  ),
                  CustomTextField(
                    label: 'Password',
                    hint: '••••••••',
                    controller: passwordController,
                  ),
                  SizedBox(height: 90.h,),
                  ToNextPageButton(title: 'Log In', onPressed: ()async{
                    await vm.login(LoginModel(login: emailController.text, password: passwordController.text));
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Token: ${vm.accessToken}')),
                    );
                  }),
                  ToNextPageButton(title: 'Sign Up', buttonTextStyle: Styles.s20w600pinkEC888D, buttonBackgroundColor: AppColors.pinkFFC6C9, onPressed: (){

                  }),
                  SizedBox(height: 57.h,),
                  Column(
                    spacing: 24.h,
                    children: [
                      Text('Forgot Password?', style: Styles.s14w600whiteFFFDF9,),
                      Text('or sign up with', style: Styles.s13w300whiteBeigeFFFDF9,),
                      Row(
                        spacing: 14.w,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.instagram, height: 26.h, ),
                          SvgPicture.asset(AppIcons.google, height: 26.h,),
                          SvgPicture.asset(AppIcons.facebook, height: 26.h,),
                          SvgPicture.asset(AppIcons.whatsapp, height: 26.h,),
                        ],
                      ),
                      Text('Don’t have an account? Sign Up', style: Styles.s13w300whiteBeigeFFFDF9,),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
