import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';

import '../../../home/managers/home_vm.dart';

class AppBarBottomItem extends StatefulWidget {
  const AppBarBottomItem({
    super.key,
    required this.vm,
  });

  final HomeViewModel vm;

  @override
  State<AppBarBottomItem> createState() => _AppBarBottomItemState();
}

class _AppBarBottomItemState extends State<AppBarBottomItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 11.w,
      children: [
        ...List.generate(
          widget.vm.categories.length,
          (index) {
            return widget.vm.isLoadingCategories
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${widget.vm.categories[index].title} category bosildi",
                          ),
                          duration: const Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      setState(() {
                        widget.vm.selectCategory(
                          widget.vm.categories[index].id,
                        );
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (widget.vm.selectedCategory ?? 2) ==
                              widget.vm.categories[index].id
                          ? AppColors.redPinkFD5D69
                          : Colors.transparent,
                      padding:  EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
                      minimumSize: Size(0.w, 0.h)
                    ),
                    child: Text(
                      widget.vm.categories[index].title,
                      style:
                          (widget.vm.selectedCategory ?? 2) ==
                              widget.vm.categories[index].id
                          ? AppStyles.s16w400white
                          : AppStyles.s16w400redPink,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
