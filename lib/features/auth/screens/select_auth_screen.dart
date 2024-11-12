import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladakh_tour/common/button/app_button.dart';
import 'package:ladakh_tour/common/colors/app_colors.dart';
import 'package:ladakh_tour/common/images/app_images.dart';
import 'package:provider/provider.dart';

class SelectAuthScreen extends StatefulWidget {
  const SelectAuthScreen({super.key});

  @override
  State<SelectAuthScreen> createState() => _SelectAuthScreenState();
}

class _SelectAuthScreenState extends State<SelectAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 375.w,
            height: 362.h,
            child: Stack(
              children: [
                Positioned(
                  top: 362.h - 486.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.ovalBg,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 48,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.onbCar,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 44.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                AppButton.outlined(
                  iconImage: AppImages.google,
                  text: "Continue with Google",
                  onTap: () async {
                    // bool b = await Provider.of<AppAuthProvider>(context,
                    //         listen: false)
                    //     .signInWithGoogle(context);

                    // if (b && context.mounted) {
                    //   Navigator.pushNamedAndRemoveUntil(
                    //       context, AppRoutes.root, (route) => false);

                    //           },
                  },
                ),
                const SizedBox(height: 14.11),
                AppButton.outlined(
                  iconImage: AppImages.apple,
                  text: "Continue with Apple",
                  onTap: () {},
                ),
                SizedBox(height: 22.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color(0xFFEEEEEE),
                      ),
                    ),
                    SizedBox(width: 14.11.w),
                    Text(
                      "or",
                      style: TextStyle(
                        color: const Color(0xFF616161),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 14.11.w),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color(0xFFEEEEEE),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppButton.fromText(
            text: "Sign in with password",
            onTap: () {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) => const LoginScreen(),
              //   ),
              // );
            },
          ),
          const Spacer(),
          CupertinoButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (_) => const RegisterScreen(),
              //   ),
              // );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF9E9E9E),
                  ),
                ),
                Text(
                  " Sign up",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.blackBackground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.paddingOf(context).bottom + 16.h),
        ],
      ),
    );
  }
}
