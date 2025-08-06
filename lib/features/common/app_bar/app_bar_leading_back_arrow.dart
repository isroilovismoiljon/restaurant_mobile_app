import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/icons.dart';

class AppBarLeadingBackArrow extends StatelessWidget {
  const AppBarLeadingBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(AppIcons.backArrow),
    );
  }
}
