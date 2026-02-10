import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';

class AppColumnWidget extends StatelessWidget {
  final List<Widget> children;
  final List<double> margin;
  final List<double> padding;
  final double? width;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final List<BoxShadow>? boxShadowList;
  final bool isBordered;

  const AppColumnWidget({
    super.key,
    required this.children,
    this.margin = const [],
    this.padding = const [],
    this.width,
    this.height,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.backgroundColor,
    this.borderRadius,
    this.borderColor,
    this.boxShadowList,
    this.isBordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(
        left: padding.isNotEmpty ? padding[0] : 0,
        top: padding.length > 1 ? padding[1] : 0,
        right: padding.length > 2 ? padding[2] : 0,
        bottom: padding.length > 3 ? padding[3] : 0,
      ),
      margin: EdgeInsets.only(
        left: margin.isNotEmpty ? margin[0] : 0,
        top: margin.length > 1 ? margin[1] : 0,
        right: margin.length > 2 ? margin[2] : 0,
        bottom: margin.length > 3 ? margin[3] : 0,
      ),
      decoration: BoxDecoration(
        boxShadow: boxShadowList,
        color: backgroundColor,
        border: isBordered ? Border.all(color: borderColor ?? (backgroundColor ?? AppColors.defaultColor)) : null,
        borderRadius: BorderRadius.circular(
          borderRadius ?? 0,
        ),
      ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
