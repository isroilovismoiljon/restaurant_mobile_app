import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscure;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.obscure = false,
    this.suffixIcon,
    this.onSuffixPressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.pinkFFC6C9,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
              icon: Icon(suffixIcon, color: Colors.grey.shade800),
              onPressed: onSuffixPressed,
            )
                : null,

          ),
        ),
      ],
    );
  }
}
