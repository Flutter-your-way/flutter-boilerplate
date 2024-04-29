// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:contract_wise/common/colors/app_colors.dart';
import 'package:contract_wise/common/images/app_images.dart';
import 'package:contract_wise/common/button/dynamic_filled_button.dart';
import 'package:contract_wise/common/button/dynamic_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<PageModel> pages = [
    PageModel(
      image: AppImages.logo,
      title: "Craving Comfort Food?",
      subtitle:
          "Here you can find a chef dish for every taste and color. Enjoy!",
    ),
    PageModel(
      image: AppImages.logo,
      title: "Rescue a Meal",
      subtitle: "Give leftover comfort food a new home reducing food waste",
    ),
    PageModel(
      image: AppImages.logo,
      title: "Bless your tummy",
      subtitle: "Enjoy a fast and smooth food delivery at your door step",
    ),
  ];

  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            top: h * .15,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.logo,
            ),
          ),
          Positioned.fill(
            left: 28,
            right: 28,
            child: Column(
              children: [
                SizedBox(height: (h * .08)),
                AnimatedOpacity(
                  opacity: _controller.positions.isNotEmpty &&
                          (_controller.page ?? 0) >= 2
                      ? 0
                      : 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      onPressed: () {
                        _controller.animateToPage(2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn);
                      },
                      child: const Text("Skip"),
                    ),
                  ),
                ),
                SizedBox(height: (h * .08)),
                Expanded(
                  child: PageView.custom(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: pages.length,
                      (context, index) {
                        PageModel m = pages[index];
                        return Column(
                          children: [
                            Image.asset(
                              m.image,
                              width: w - 60,
                              height: w - 60,
                            ),
                            const SizedBox(height: 30),
                            Text(
                              m.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                m.subtitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  if (_controller.positions.isNotEmpty) {
                    if ((_controller.page ?? 0) >= 2) {
                      return DynamicFilledButton(
                        widthFactor: 1,
                        // borderRadius: BorderRadius.circular(100),
                        color: AppColors.primaryGreen,
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   CupertinoPageRoute(
                          //     builder: (context) => const MobileScreen(),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }
                  }

                  bool showPrev = _controller.positions.isEmpty
                      ? false
                      : (_controller.page ?? 0) < 1
                          ? true
                          : false;

                  return SizedBox(
                    height: 100,
                    width: w,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          right: showPrev ? -100 : 100,
                          curve: Curves.fastEaseInToSlowEaseOut,
                          duration: const Duration(milliseconds: 400),
                          child: DynamicIconButton(
                            icon: Icon(
                              Icons.arrow_right,
                              color: AppColors.primaryGreen,
                            ),
                            onPressed: () {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn);
                            },
                          ),
                        ),
                        AnimatedPositioned(
                          right: 20,
                          duration: const Duration(milliseconds: 400),
                          child: DynamicIconButton(
                            icon: Icon(
                              Icons.arrow_right,
                              color: AppColors.primaryGreen,
                            ),
                            onPressed: () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(height: MediaQuery.paddingOf(context).bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageModel {
  String image;
  String title;
  String subtitle;
  PageModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
