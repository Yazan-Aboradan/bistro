import 'package:flutter/material.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';

class AppRowWidget extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<double> margin;
  final List<double> padding;
  final double? width;
  final double? height;
  final bool? isBordered;
  final double? borderWidth;
  final Color? borderColor;
  final List<double> borderRadius;
  final Color? backgroundColor;
  final TextDirection? textDirection;

  const AppRowWidget({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.margin = const [],
    this.padding = const [],
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = const [],
    this.borderColor = AppColors.defaultColor,
    this.isBordered = false,
    this.borderWidth = 0,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainerWidget(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      isBordered: isBordered,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      child: Row(
        mainAxisAlignment: mainAxisAlignment!,
        crossAxisAlignment: crossAxisAlignment!,
        textDirection: textDirection,
        children: children,
      ),
    );
  }
}
