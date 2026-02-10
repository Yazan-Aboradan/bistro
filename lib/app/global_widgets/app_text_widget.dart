import 'package:flutter/material.dart';


class AppTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final TextStyle? style;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow overflow;
  final double? fontSize;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextHeightBehavior? textHeightBehavior;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
final double? height;

  const AppTextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.style,
    this.fontFamily,
    this.textDirection = TextDirection.ltr,
    this.maxLines=3,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
    this.textHeightBehavior,
    this.textAlign,
    this.height,

  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: color,
            fontSize: fontSize,
            decoration: decoration,
            decorationStyle: decorationStyle,
            decorationColor: decorationColor,
            decorationThickness: decorationThickness,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
