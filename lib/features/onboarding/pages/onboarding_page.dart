import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_app/core/utils/app_colors.dart';
import 'package:restourant_mobile_app/features/onboarding/widgets/to_next_page_button.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../../common/bottom_navigation_bar/bottom_navigation_bar_gradient.dart';
import '../magagers/cuisine_view_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool leadingBackArrow = false;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CuisineViewModel(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundBeigeGradient1C0F0D,
            leading: leadingBackArrow
                ? IconButton(
                    onPressed: () {
                      pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: SvgPicture.asset(AppIcons.backArrow),
                  )
                : null,
          ),

          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                leadingBackArrow = index == 1;
              });
            },
            children: [
              Column(
                spacing: 23.h,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get inspired',
                        style: Styles.s20w600whiteFFFDF9,
                      ),
                      Text(
                        'Get inspired with our daily recipe recommendations.',
                        style: Styles.s13w400whiteFFFDF9,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 722.h,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.network(
                            "https://i.pinimg.com/736x/e1/50/ee/e150ee2685fbb8dcfd1b9143e4dc8f8b.jpg",
                            width: double.infinity,
                            height: 720.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 280.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.backgroundBeigeGradient1C0F0D,
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomNavigationBarGradient(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ToNextPageButton(
                            buttonBackgroundColor: AppColors.pinkFFC6C9,
                            buttonTextStyle: Styles.s20w600pinkEC888D,
                            title: 'Continue',
                            onPressed: () {
                              pageController.animateToPage(
                                1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Column(
                spacing: 23.h,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get an increase your skills',
                        style: Styles.s20w600whiteFFFDF9,
                      ),
                      Text(
                        '"Learn essential cooking techniques at your own pace.',
                        style: Styles.s13w400whiteFFFDF9,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 722.h,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.network(
                            "https://i.pinimg.com/736x/92/07/53/92075334654bb91ca1ed50bfca3f546a.jpg",
                            width: double.infinity,
                            height: 720.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 280.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.backgroundBeigeGradient1C0F0D,
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomNavigationBarGradient(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ToNextPageButton(
                            buttonBackgroundColor: AppColors.pinkFFC6C9,
                            buttonTextStyle: Styles.s20w600pinkEC888D,
                            title: 'Continue',
                            onPressed: () {
                              context.push(Routers.welcomePage);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
