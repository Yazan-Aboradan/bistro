import 'app_icon_widget.dart';
import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';

class AppCircleButtonWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? backgroundSize;
  final bool isBordered;
  final Color? borderColor;
  final double? borderWidth;
  final double innerPadding;

  const AppCircleButtonWidget({
    super.key,
    required this.iconData,
    this.iconColor = AppColors.black01,
    this.iconSize = 30,
    required this.onPressed,
    this.backgroundColor,
    this.backgroundSize=0,
    this.isBordered = false,
    this.borderColor,
    this.borderWidth,
    this.innerPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(innerPadding),
      decoration: isBordered
          ? BoxDecoration(
              border: Border.all(
                color: borderColor ?? AppColors.defaultColor,
                width: borderWidth ?? 0,
              ),
              shape: BoxShape.circle,
              color: backgroundColor,
            )
          : null,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: AppIconWidget(
          iconData: iconData,
          size: iconSize,
          color: iconColor,
        ),
        iconSize: iconSize,
        onPressed: onPressed,
      ),
    );
  }
}
