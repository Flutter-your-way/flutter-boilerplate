// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ladakh_tour/common/colors/app_colors.dart';
import 'package:ladakh_tour/common/images/app_images.dart';
import 'package:ladakh_tour/common/button/dynamic_filled_button.dart';
import 'package:ladakh_tour/common/button/dynamic_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<PageModel> pages = [
    PageModel(
      image: AppImages.onboarding_mockup,
      title: "Welcome to Ladakh Tempo Association - Your Journey, Your Way",
      subtitle:
          "Get ready to experience hassle-free transportation. We've got everything you need to travel with ease. Let's get started!",
    ),
    PageModel(
      image: AppImages.onboarding_mockup,
      title: "Book your seat in a shared tour.",
      subtitle: "Share the tour with other fellow travellers.",
    ),
    PageModel(
      image: AppImages.onboarding_mockup,
      title: "Secure Payments & Seamless Transactions",
      subtitle:
          "Say hello to convenience payments. Pay for your rides securely using AppName Wallet, PayPal, Google Pay, Apple Pay, card, and or cash.",
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
      backgroundColor: AppColors.primaryGreen,
      body: Stack(
        children: [
          Positioned.fill(
            // left: 28,
            // right: 28,
            child: Column(
              children: [
                SizedBox(height: (h * .08)),
                Expanded(
                  child: PageView.custom(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: pages.length,
                      (context, index) {
                        PageModel m = pages[index];
                        return Stack(
                          children: [
                            Positioned(
                              left: 24,
                              right: 24,
                              child: Image.asset(
                                m.image,
                                width: 345,
                                height: 700,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 450,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                color: AppColors.white,
                                child: Column(
                                  children: [
                                    Text(
                                      m.title,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 32,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      m.subtitle,
                                      style: GoogleFonts.urbanist(
                                        color: AppColors.grey,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    SmoothPageIndicator(
                                      controller: _controller,
                                      count: pages.length,
                                      effect: ExpandingDotsEffect(
                                        activeDotColor: AppColors.primaryGreen,
                                        dotColor: AppColors.grey,
                                        dotHeight: 8.0,
                                        dotWidth: 16.0,
                                        expansionFactor: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Builder(builder: (context) {
                                      if (_controller.positions.isNotEmpty) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.lightGreen,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1002),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 56,
                                                    vertical: 16),
                                                child: Text(
                                                  "Skip",
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryGreen,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _controller.nextPage(
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve:
                                                          Curves.fastOutSlowIn);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.primaryGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1002),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 56,
                                                      vertical: 16),
                                                  child: Text(
                                                    "Continue",
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
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
