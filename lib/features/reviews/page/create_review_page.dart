import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/routing/routes.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/data/models/recipes/recipe_review_model.dart';
import 'package:restourant_mobile_app/data/models/recipes/review_model.dart';
import 'package:restourant_mobile_app/features/reviews/managers/reviews_vm.dart';
import 'package:restourant_mobile_app/features/reviews/widgets/create_review_button.dart';
import 'package:restourant_mobile_app/features/reviews/widgets/rating_stars.dart';
import 'package:restourant_mobile_app/features/reviews/widgets/recommend_recipe_radio.dart';

import '../../common/widgets/app_bar/my_app_bar.dart';
import '../../common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';

class CreateReviewPage extends StatefulWidget {
  final int recipeId;

  CreateReviewPage({super.key, required this.recipeId});

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  int rating = 0;

  final commentController = TextEditingController();
  final photoController = TextEditingController();
  File? selectedImage;
  bool recommend = true;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(recipeId: widget.recipeId, repository: context.read()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: MyAppBar(
          categoryTitle: 'Leave A Review',
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 262.h,
                  child: Selector<ReviewsViewModel, (bool, RecipeReviewModel?)>(
                    selector: (context, vm) => (vm.isLoadingRecipe, vm.recipe),
                    builder: (context, data, child) {
                      final (isLoading, recipe) = data;
                      return isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  width: 356.w,
                                  height: 262.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.redPinkFD5D69,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.network(
                                    recipe!.photo,
                                    width: 356.w,
                                    height: 206.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      recipe.title,
                                      style: AppStyles.s20w500whiteFFFDF9,
                                    ),
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingStars(
                      onChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                    Text(
                      'Your overall rating',
                      style: AppStyles.s12w400whiteFFFDF9,
                    ),
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                TextField(
                  maxLines: 4,
                  controller: commentController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.pinkFFC6C9,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
                    hintText: 'Leave us Review!',
                    hintStyle: AppStyles.s15w400beige1C0F0D_opacity45,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  spacing: 8.w,
                  children: [
                    IconButton(
                      onPressed: pickImage,
                      icon: Icon(
                        Icons.add,
                        color: AppColors.pinkColorEC888D,
                        size: 15.h,
                      ),
                      padding: EdgeInsets.all(4.r),
                      constraints: BoxConstraints(minWidth: 21.w, minHeight: 21.h),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.pinkFFC6C9,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Text(
                      'Add Photo',
                      style: AppStyles.s15w500whiteBeigeFFFDF9,
                    ),
                  ],
                ),
                if (selectedImage != null) Image.file(selectedImage!, width: 100, height: 100, fit: BoxFit.cover),
                SizedBox(
                  height: 23.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Do you recommend this recipe?',
                      style: AppStyles.s12w400whiteFFFDF9.copyWith(height: 1.h),
                    ),
                    RecommendRecipeRadio(
                      onChanged: (value) {
                        setState(() {
                          recommend = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CreateReviewButton(
                      title: 'Cancel',
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    Consumer<ReviewsViewModel>(
                      builder: (context, vm, child) {
                        return
                          CreateReviewButton(
                          title: 'Submit',
                          backgroundColor: AppColors.redPinkFD5D69,
                          textStyle: AppStyles.s15w500whiteBeigeFFFDF9,
                          onPressed: () async {
                            var result = await vm.addReview(
                              ReviewModel(
                                rating: rating,
                                comment: commentController.text,
                                recipeId: widget.recipeId,
                                recommend: recommend,
                              ),
                            );
                            if (result != 'ok') return;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(34.w, 45.h, 34.w, 30.h),
                                    width: 276.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteD9D9D9,
                                      borderRadius: BorderRadius.circular(40.r),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      spacing: 20.h,
                                      children: [
                                        Column(
                                          spacing: 15.h,
                                          children: [
                                            Text(
                                              'Thank You For Your Review!',
                                              style: AppStyles.s20w600beige1C0F0D,
                                              textAlign: TextAlign.center,
                                            ),
                                            SvgPicture.asset(AppIcons.bigTick, width: 59.w),
                                            Text(
                                              'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.',
                                              style: AppStyles.s13w400beige1C0F0D,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.go(Routers.home);
                                          },
                                          style: TextButton.styleFrom(backgroundColor: AppColors.redPinkFD5D69),
                                          child: Text(
                                            'Go To Home',
                                            style: AppStyles.s20w600whiteFFFDF9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
