import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';

import '../../../core/utils/styles.dart';
import '../../../core/utils/app_colors.dart';
import '../managers/register_vm.dart';

// ViewModel

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Scaffold(
        backgroundColor: const Color(0xFF1C0F0D),
        body: SafeArea(
          child: Consumer<RegisterViewModel>(
            builder: (context, vm, child) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.redPinkFD5D69,
                      ),
                    ),
                    const SizedBox(height: 100),

                    // Full Name
                    myTextField(
                      label: "Full Name",
                      hint: "John Doe",
                    ),

                    const SizedBox(height: 16),

                    // Email
                    myTextField(
                      label: "Email",
                      hint: "example@example.com",
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    // Mobile Number
                    myTextField(
                      label: "Mobile Number",
                      hint: "+ 123 456 789",
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 16),

                    // Date of Birth
                    myTextField(
                      label: "Date Of Birth",
                      hint: "DD / MM / YYY",
                      keyboardType: TextInputType.datetime,
                    ),

                    const SizedBox(height: 16),

                    // Password
                    myTextField(
                      label: "Password",
                      hint: "••••••••",
                      obscure: true,
                      suffixIcon: Icons.visibility_off,
                    ),

                    const SizedBox(height: 16),

                    // Confirm Password
                    myTextField(
                      label: "Confirm Password",
                      hint: "••••••••",
                      obscure: true,
                      suffixIcon: Icons.visibility_off,
                    ),

                    const SizedBox(height: 16),

                    // Terms text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text.rich(
                        TextSpan(
                          text: "By continuing, you agree to ",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                          children: [
                            TextSpan(
                              text: "Terms of Use",
                              style: TextStyle(color: AppColors.pinkFFC6C9),
                            ),
                            TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: AppColors.pinkFFC6C9),
                            ),
                            TextSpan(text: "."),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Sign Up button
                    SizedBox(
                      width: 194.w,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redPinkFD5D69,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: Styles.s20w600whiteFFFDF9,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Already have an account?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: AppColors.pinkFFC6C9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget myTextField({
    required String label,
    required String hint,
    TextInputType? keyboardType,
    bool obscure = false,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextField(
          keyboardType: keyboardType,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.pinkFFC6C9,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
              icon: Icon(suffixIcon, color: Colors.grey.shade800),
              onPressed: () {},
            )
                : null,
          ),
        ),
      ],
    );
  }
}
