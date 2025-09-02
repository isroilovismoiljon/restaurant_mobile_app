import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/icons.dart';

class AppBarLeadingBackArrow extends StatelessWidget {
  const AppBarLeadingBackArrow({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(AppIcons.backArrow)),
    );
  }
}
