import 'package:contract_wise/common/images/app_images.dart';
import 'package:contract_wise/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void process() async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.onboarding,
      (_) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      process();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.fromSize(
        size: MediaQuery.sizeOf(context),
        child: Image.asset(
          AppImages.logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
