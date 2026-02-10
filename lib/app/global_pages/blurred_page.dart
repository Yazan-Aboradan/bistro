import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:go_router/go_router.dart';

class BlurredPage extends StatelessWidget {
  final Color? color;
  final double? opacity;

  const BlurredPage({
    super.key,
    this.color = AppColors.primary,
    this.opacity = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () {
          // Close the dialog using GoRouter
          GoRouter.of(context).pop();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: color!.withValues(alpha: opacity),
          ),
        ),
      ),
      // Centered dialog box content
    );
  }
}
