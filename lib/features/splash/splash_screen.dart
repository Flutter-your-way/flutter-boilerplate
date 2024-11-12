import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ladakh_tour/common/colors/app_colors.dart';
import 'package:ladakh_tour/common/images/app_images.dart';
import 'package:ladakh_tour/features/onboarding/screen/onboarding_screen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  func() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (_) => const OnboardingScreenTwo(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      func();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: AppColors.blackBackground,
      body: Center(
        child: Image.asset(
          AppImages.splashLogo,
          width: MediaQuery.sizeOf(context).width,
        ),
      ),
    );
  }
}
