import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_container_widget.dart';

class AppIconWidget extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final Color? backgroundColor;
  final double size;
  final void Function()? onTap;
  final bool isBordered;
  final List<double> padding;
  final Color? borderColor;
  final List<double> borderRadius;
  final double? borderWidth;

  const AppIconWidget({
    super.key,
    required this.iconData,
    this.color = AppColors.gray03,
    this.backgroundColor,
    this.size = 34,
    this.onTap,
    this.isBordered = false,
    this.padding = const [],
    this.borderColor,
    this.borderRadius = const [20, 20, 20, 20],
    this.borderWidth,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AppContainerWidget(
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        backgroundColor: backgroundColor,
        isBordered: isBordered,
        borderColor: borderColor,
        padding: padding,
        child: Icon(
          iconData,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
/*
 isClickable ? InkWell(
      onTap: onTap,
      child: AppContainerWidget(
        padding: padding,
        width: dimension,
        height: dimension,
        borderRadius: [dimension / 2], // force circular
        backgroundColor: backgroundColor,
        child: Icon(
          iconData,
          color: color,
          size: size,
        ),
      ),
    ) :
 */
