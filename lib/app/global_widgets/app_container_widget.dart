import 'package:flutter/material.dart';

class AppContainerWidget extends StatelessWidget {
  final Widget? child;
  final List<double> margin;
  final List<double> padding;
  final double? width;
  final double? height;
  final bool? isBordered;
  final double? borderWidth;
  final Color? borderColor;
  final List<double> borderRadius;
  final Color? backgroundColor;

  const AppContainerWidget({
    super.key,
    this.child,
    this.margin = const [],
    this.padding = const [],
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = const [],
    this.borderColor ,
    this.isBordered = false,
    this.borderWidth = 0,
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
          color: backgroundColor,
          border: isBordered!
              ? Border.all(
                  width: borderWidth ?? 0 ,
                  color: borderColor ?? Colors.transparent,
                )
              : null,
          borderRadius: BorderRadius.only(
            topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
            topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
            bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
            bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
          ),
        ),
        child: child,
    );
  }
}
