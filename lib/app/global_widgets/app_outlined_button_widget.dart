import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';
import 'app_icon_widget.dart';
import 'app_text_widget.dart';

class AppOutlinedButtonWidget extends StatelessWidget {
  final IconData? iconData;
  final Color iconColor;
  final double iconSize;
  final String? text;
  final Color textColor;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final double radius;

  const AppOutlinedButtonWidget({
    super.key,
    this.iconData,
    this.iconColor = AppColors.purple01,
    this.iconSize = 36,
    this.text,
    this.textColor = AppColors.gray03,
    this.textStyle,
    required this.onPressed,
    this.radius = AppDimensions.radius08,
  })  : assert(
          iconData != null || text != null,
          'IconData or text must be not null',
        );

  @override
  Widget build(BuildContext context,) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius,
            ),
          ),
        ),
      ),
      child: Row(
        children: [
          // Icon
          if (iconData != null)
            AppIconWidget(
              iconData: iconData!,
              color: iconColor,
              size: iconSize,
            ),

          // Space
          if (iconData != null && text != null)
             Gap(
              AppDimensions.gap04w,
            ),

          // Text
          if (text != null)
            AppTextWidget(
              text: text ?? '',
              color: textColor,
              style: textStyle,
            ),
        ],
      ),
    );
  }
}
