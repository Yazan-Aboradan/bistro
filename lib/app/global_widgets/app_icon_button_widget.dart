import 'package:flutter/material.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_icon_widget.dart';

class AppIconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final double? iconSize;
  final Color? backgroundColor;
  final List<double> borderRadius;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double padding;
  final Color? borderColor;

  const AppIconButtonWidget({
    super.key,
    required this.iconData,
    this.iconColor = AppColors.gray03,
    this.iconSize = 20,
    this.backgroundColor = AppColors.defaultColor,
    this.borderRadius = const [],
    required this.onPressed,
    this.width,
    this.height,
    this.padding = 0,
    this.borderColor = AppColors.defaultColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainerWidget(
      width: width,
      // Set width if provided
      height: height,
      // Se
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      child: IconButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(padding), // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius[0] ?? 0.0),
          ),
          backgroundColor: Colors.transparent, // Avoid overriding container's color
        ),
        onPressed: onPressed,
        icon: AppIconWidget(
          iconData: iconData!,
          color: iconColor,
          size: iconSize!,
        ),
      ),
    );
  }
}
