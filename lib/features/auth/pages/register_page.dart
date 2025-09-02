import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../../data/models/auth/register_model.dart';
import '../managers/register_vm.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(repository: context.read()),
      child: Scaffold(
        backgroundColor: Color(0xFF1C0F0D),
        body: SafeArea(
          child: Consumer<RegisterViewModel>(
            builder: (context, vm, child) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 5.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: AppStyles.s20w600redPinkFD5D69
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      spacing: 15.h,
                      children: [
                        CustomTextField(
                          label: "Full Name",
                          hint: "John Doe",
                          controller: fullNameController,
                        ),
                        CustomTextField(
                          label: "Username",
                          hint: "john_doe",
                          controller: usernameController,
                        ),
                        CustomTextField(
                          label: "Email",
                          hint: "example@example.com",
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                        CustomTextField(
                          label: "Mobile Number",
                          hint: "+ 123 456 789",
                          keyboardType: TextInputType.phone,
                          controller: mobileNumberController,
                        ),
                        CustomTextField(
                          label: "Date Of Birth",
                          hint: "DD / MM / YYY",
                          keyboardType: TextInputType.datetime,
                          controller: dateOfBirthController,
                        ),
                        CustomTextField(
                          label: "Password",
                          hint: "••••••••",
                          obscure: true,
                          suffixIcon: Icons.visibility_off,
                          controller: passwordController,
                        ),
                        CustomTextField(
                          label: "Confirm Password",
                          hint: "••••••••",
                          obscure: true,
                          suffixIcon: Icons.visibility_off,
                          controller: confirmPasswordController,
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Text.rich(
                        TextSpan(
                          text: "By continuing, you agree to\n",
                          style: AppStyles.s14w400whiteFFFDF9,
                          children: [
                            TextSpan(
                              text: "Terms of Use",
                              style: AppStyles.s14w600whiteFFFDF9,
                            ),
                            TextSpan(
                              text: " and ",
                              style: AppStyles.s14w400whiteFFFDF9,
                            ),
                            TextSpan(
                              text: "Privacy Policy.",
                              style: AppStyles.s14w600whiteFFFDF9,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 194.w,
                      height: 45.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          final nameParts = fullNameController.text
                              .trim()
                              .split(' ');
                          await vm.register(
                            RegisterModel(
                              username: usernameController.text,
                              firstName: nameParts.isNotEmpty
                                  ? nameParts[0]
                                  : '',
                              lastName: nameParts.length > 1
                                  ? nameParts[1]
                                  : '',
                              email: emailController.text,
                              phoneNumber: mobileNumberController.text,
                              birthDate: dateOfBirthController.text,
                              password: passwordController.text,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(vm.accessToken.toString())),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redPinkFD5D69,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: AppStyles.s20w600whiteFFFDF9,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppStyles.s13w300whiteBeigeFFFDF9,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Log In",
                            style: AppStyles.s13w300redPinkFD5D69,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
