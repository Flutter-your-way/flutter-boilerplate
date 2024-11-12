import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ladakh_tour/common/button/app_button.dart';
import 'package:ladakh_tour/common/colors/app_colors.dart';
import 'package:ladakh_tour/common/images/app_images.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> {
  int cPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 486.h,
            width: 375.w,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppImages.ovalBg,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            bottom: 72.h,
                            right: 0,
                            height: 226.h,
                            child: Image.asset(
                              AppImages.truck1,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: 99.h,
                            left: 0,
                            height: 213.h,
                            child: Image.asset(
                              AppImages.truck2,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: 49.h,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              AppImages.onbCar,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 16.h,
                  left: 26.w,
                  right: 26.w,
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        opacity: cPage == 2 ? 0 : 1,
                        duration: const Duration(milliseconds: 200),
                        child: CupertinoButton(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: AppColors.whiteBackground,
                              fontFamily: GoogleFonts.outfit().fontFamily,
                              fontSize: 16.sp,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   CupertinoPageRoute(
                            //     builder: (context) => const SelectAuthScreen(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          _pageDot(0),
                          _pageDot(1),
                          _pageDot(2),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: AnimatedCrossFade(
              firstChild: _onbText(
                  title: cPage > 1
                      ? "Lorem ipsum dolor sit amet."
                      : "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  caption: cPage >= 1
                      ? "Lorem ipsum dolor sit amet."
                      : "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
              secondChild: _onbText(
                  title: "Lorem ipsum dolor sit amet, consectetur ",
                  caption:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
              crossFadeState: (cPage == 0 || cPage == 2)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
            ),
          ),
          AnimatedCrossFade(
            firstChild: AppButton.fromText(
              text: "Next",
              onTap: () {
                setState(() {
                  cPage++;
                });

                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastEaseInToSlowEaseOut,
                );
              },
            ),
            secondChild: AppButton.fromText(
              text: "Get Started",
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (context) => const SelectAuthScreen(),
                //   ),
                // );
              },
            ),
            crossFadeState: cPage == 2
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
          SizedBox(height: MediaQuery.paddingOf(context).bottom),
        ],
      ),
    );
  }

  SizedBox _onbText({
    required String title,
    required String caption,
  }) {
    return SizedBox(
      width: 325.w,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackBackground,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Text(
            caption,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.captionText,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _pageDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      height: 5.h,
      width: index == cPage ? 27.w : 5.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}
