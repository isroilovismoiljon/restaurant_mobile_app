import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import '../../../data/models/users/chef.dart';
import '../managers/home_vm.dart';
import 'top_chef_widget.dart';

class TopChefsWidget extends StatelessWidget {
  const TopChefsWidget({
    super.key,
    required this.chefs,
    required this.vm,
  });

  final HomeViewModel vm;
  final List<ChefModel> chefs;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Chef',
          style: Styles.s15w500redPinkFD5D69,
        ),
        vm.isLoadingChefs
            ? CircularProgressIndicator()
            : vm.errorChefs.length > 0
            ? Center(
                child: Text(vm.errorChefs),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    4,
                    (index) {
                      return GestureDetector(
                        onTap: (){
                          context.push(Routers.topChefs);
                        },
                        child: TopChefWidget(
                          firstName: chefs[index].firstName,
                          profilePhoto: chefs[index].profilePhoto,
                        ),
                      );
                    },
                  ),
                ],
              ),
      ],
    );
  }
}
