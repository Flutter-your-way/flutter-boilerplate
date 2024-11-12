import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladakh_tour/common/colors/app_colors.dart';
import 'package:ladakh_tour/features/onboarding/screen/onboarding_screen.dart';
import 'package:ladakh_tour/features/onboarding/screen/onboarding_screen2.dart';
import 'package:ladakh_tour/features/splash/splash_screen.dart';
import 'package:ladakh_tour/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                scrolledUnderElevation: 0,
                elevation: 0,
              ),
              scaffoldBackgroundColor: AppColors.whiteBackground,
              colorScheme: ColorScheme.fromSeed(
                surface: AppColors.whiteBackground,
                seedColor: AppColors.primaryColor,
              ),
              fontFamily: GoogleFonts.outfit().fontFamily,
            ),
            initialRoute: AppRoutes.splash,
            routes: {
              AppRoutes.splash: (context) => const SplashScreen(),
              AppRoutes.onboardingScreenTwo: (context) =>
                  const OnboardingScreenTwo(),
            },
          );
        });
  }
}
