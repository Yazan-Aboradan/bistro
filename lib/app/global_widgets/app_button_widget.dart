import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_icon_widget.dart';
import 'app_text_widget.dart';

class AppButtonWidget extends StatelessWidget {
  final IconData? iconData;
  final Color iconColor;
  final double? iconSize;
  final String? text;
  final Color textColor;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double paddingV;
  final double paddingH;
  final Color? borderColor;
  final double borderWidth;
  final bool isBordered;

  const AppButtonWidget({
    super.key,
    this.iconData,
    this.iconColor = AppColors.gray03,
    this.iconSize = 20,
    this.text = '',
    this.textColor = AppColors.black01,
    this.textStyle,
    this.backgroundColor = AppColors.defaultColor,
    this.borderRadius = 0,
    required this.onPressed,
    this.width,
    this.height,
    this.paddingH = 0,
    this.paddingV = 0,
    this.borderColor = AppColors.defaultColor,
    this.borderWidth = 0,
    this.isBordered = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        color: !isBordered ? backgroundColor : null,
        decoration: isBordered
            ? BoxDecoration(
          border: Border.all(
            color: borderColor!,
            width: 0,
          ),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!), // Default radius 8
        )
            : null,
        child: iconData != null
            ? TextButton.icon(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV), // Remove default padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            backgroundColor: Colors.transparent, // Avoid overriding container's color
          ),
          onPressed: onPressed,
          icon: AppIconWidget(
            // Prevents null issues
            iconData: iconData!,
            color: iconColor,
            size: iconSize!,
          ),
          label: AppTextWidget(
            text: text!,
            color: textColor,
            style: textStyle,
          ),
        )
            : TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: paddingV , horizontal: paddingH), // Remove default padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            backgroundColor: Colors.transparent, // Avoid overriding container's color
          ),
          onPressed: onPressed,
          child: AppTextWidget(
            text: text!,
            color: textColor,
            style: textStyle,
          ),
        ));
  }
}
