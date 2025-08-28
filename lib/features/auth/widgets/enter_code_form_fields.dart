import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class EnterCodeFormFields extends StatelessWidget {
  const EnterCodeFormFields({
    super.key,
    required this.controllers,
    required this.focusNodes,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15.w,
      children: [
        ...List.generate(
          6,
          (index) {
            return TextFormField(
              controller: controllers[index],
              textAlign: TextAlign.center,
              focusNode: focusNodes[index],
              onChanged: (value){
                if (index < 6) {
                  focusNodes[index + 1].requestFocus();
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    color: AppColors.redPinkFD5D69,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    color: AppColors.redPinkFD5D69,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    color: AppColors.redPinkFD5D69,
                  ),
                ),
                constraints: BoxConstraints(
                  maxWidth: 40.w,
                  maxHeight: 40.h,
                ),
                counter: SizedBox.shrink(),
              ),

              style: Styles.s17w600whiteFFFDF9,
              maxLength: 1,
            );
          },
        ),
      ],
    );
  }
}
