import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladakh_tour/common/button/scale_button.dart';
import 'package:ladakh_tour/common/colors/app_colors.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.onTap,
    this.padding,
    this.decoration,
    this.margin,
  });

  @override
  State<AppButton> createState() => AppButtonState();

  final Widget child;
  final FutureOr<void> Function() onTap;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final double? margin;

  static fromText({
    required String text,
    required FutureOr<void> Function() onTap,
    IconData? icon,
    EdgeInsets? padding,
  }) {
    return AppButton(
      padding: padding,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteBackground,
            ),
          ),
          if (icon != null) SizedBox(width: 10.w),
          if (icon != null) Icon(icon, color: AppColors.whiteBackground),
        ],
      ),
    );
  }

  static outlined({
    required String text,
    required FutureOr<void> Function() onTap,
    String? iconImage,
    EdgeInsets? padding,
  }) {
    return AppButton(
      padding: EdgeInsets.zero,
      margin: 0,
      onTap: onTap,
      decoration: const BoxDecoration(),
      child: SmoothContainer(
        padding: padding ?? EdgeInsets.symmetric(vertical: 16.5.h),
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFFEEEEEE), width: .88),
        smoothness: .9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconImage != null)
              Image.asset(
                iconImage,
                width: 22.w,
              ),
            if (iconImage != null) SizedBox(width: 10.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppButtonState extends State<AppButton> {
  bool isLoading = false;

  func() async {
    setState(() {
      isLoading = true;
    });

    try {
      await widget.onTap();
    } catch (e) {
      log("$e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget.margin ?? 25.w),
      child: ScaleButton(
        onTap: isLoading ? null : func,
        child: Container(
          padding: widget.padding ?? EdgeInsets.symmetric(vertical: 16.5.h),
          decoration: widget.decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.blackBackground,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF212121).withOpacity(.25),
                    offset: const Offset(3.53, 7.05),
                    blurRadius: 21.16,
                  ),
                ],
              ),
          child: Center(
            child: isLoading
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : widget.child,
          ),
        ),
      ),
    );
  }
}
