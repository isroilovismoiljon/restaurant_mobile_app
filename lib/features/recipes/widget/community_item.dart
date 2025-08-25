import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/time/time_helper.dart';
import 'package:restourant_mobile_app/features/recipes/widget/community_item_recipe.dart';

import '../../../core/routing/routes.dart';
import '../../../data/models/recipes/community_model.dart';

class CommunityItem extends StatelessWidget {
  const CommunityItem({
    super.key,
    required this.community,
  });

  final CommunityModel community;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        GestureDetector(
          onTap: () {
            context.push(
              Routers.chefProfile,
              extra: community.user.id,
            );
          },
          child: Row(
            spacing: 14.w,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17.r),
                child: Image.network(
                  community.user.profilePhoto,
                  width: 35.w,
                  height: 35.h,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@${community.user.username}',
                    style: Styles.s15w400whiteBeigeFFFDF9poppins,
                  ),
                  Text(
                    '${TimeHelper.timeAgo(community.created.toString())}',
                    style: Styles.s12w400pinkColorEC888D,
                  ),
                ],
              ),
            ],
          ),
        ),
        CommunityItemRecipe(community: community),
      ],
    );
  }
}
