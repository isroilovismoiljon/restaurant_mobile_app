import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

class RecommendRecipeRadio extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  const RecommendRecipeRadio({
    super.key, required this.onChanged,
  });

  @override
  State<RecommendRecipeRadio> createState() => _RecommendRecipeRadioState();
}

class _RecommendRecipeRadioState extends State<RecommendRecipeRadio> {
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 109.w,
      children: [
        Row(
          children: [
            Text(
              'No',
              style: AppStyles.s15w300whiteFFFDF9,
            ),
            Radio(
              value: 'No',
              fillColor: MaterialStateProperty.all(AppColors.redPinkFD5D69),
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
                widget.onChanged(false);
              },
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Yes',
              style: AppStyles.s15w300whiteFFFDF9,
            ),
            Radio(
              value: 'Yes',
              groupValue: groupValue,
              fillColor: MaterialStateProperty.all(AppColors.redPinkFD5D69),
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
                widget.onChanged(true);
              },
            ),
          ],
        ),
      ],
    );
  }
}
