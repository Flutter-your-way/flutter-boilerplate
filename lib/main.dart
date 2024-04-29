import 'package:contract_wise/common/colors/app_colors.dart';
import 'package:contract_wise/features/onboarding/screen/onboarding_screen.dart';
import 'package:contract_wise/features/splash/splash_screen.dart';
import 'package:contract_wise/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.white,
          brightness: Brightness.dark,
          background: AppColors.white,
        ),
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
      },
    );
  }
}
