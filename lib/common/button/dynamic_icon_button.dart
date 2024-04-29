import 'dart:async';

import 'package:contract_wise/common/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DynamicIconButton extends StatelessWidget {
  const DynamicIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final FutureOr<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return (defaultTargetPlatform == TargetPlatform.iOS)
        ? CupertinoButton(
            onPressed: onPressed,
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(100),
            padding: EdgeInsets.zero,
            child: icon,
          )
        : IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
            ),
            onPressed: onPressed,
            icon: icon,
          );
  }
}
