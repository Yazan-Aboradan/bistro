import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_icon_widget.dart';
import 'app_text_widget.dart';

class AppNormalButtonWidget extends StatelessWidget {
  final IconData? iconData;
  final Color iconColor;
  final String text;
  final Color textColor;
  final TextStyle? textStyle;
  final void Function() onPressed;

  const AppNormalButtonWidget({
    Key? key,
    this.iconData,
    this.iconColor = AppColors.gray03,
    required this.text,
    this.textColor = AppColors.gray03,
    this.textStyle,
    required this.onPressed,
  }) : super(
    key: key,
  );

  @override
  Widget build(BuildContext context,) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: iconData == null
          ? null
          : AppIconWidget(
        iconData: iconData!,
        color: iconColor,
        size: AppDimensions.iconSize20,
      ),
      label: AppTextWidget(
        text: text,
        color: textColor,
        style: textStyle,
      ),
    );
  }
}
