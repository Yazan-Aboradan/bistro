import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';
import 'package:bistro/app/global_widgets/app_icon_widget.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bistro/app/core/values/app_dimensions.dart';



class AppDropDrownListFieldWidget extends HookConsumerWidget {
  final String defaultOptionText;
  final AppTextWidget? defaultOptionTextWidget;
  final AppIconWidget? buttonIconWidget;
  final AppTextWidget? optionsTextWidget;
  final TextEditingController controller;
  final AppIconWidget? prefixIcon;
  final AppIconWidget? suffix;
  final bool isBordered;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<String> optionsList;
  final double? width;
  final double? height;
  final double? borderWidth;
  final List<double> borderRadius;
  final List<double> padding;
  final List<double> dropDownBorderRadius;
  final Color? dropDownBackgroundColor;
  final Alignment alignment;

  const AppDropDrownListFieldWidget({
    super.key,
    required this.controller,
    required this.defaultOptionText,
    required this.optionsList,
    required this.isBordered,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = const [],
    this.padding = const [],
    this.defaultOptionTextWidget,
    this.optionsTextWidget,
    this.buttonIconWidget,
    this.prefixIcon,
    this.suffix,
    this.backgroundColor,
    this.height,
    this.width,
    this.dropDownBackgroundColor,
    this.dropDownBorderRadius=const[],
    this.alignment=Alignment.center,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppContainerWidget(
      borderRadius: borderRadius,
      height: height,
      borderColor: borderColor,
      isBordered: isBordered,
      backgroundColor: backgroundColor,
      width: width,
      padding: padding,
      borderWidth: borderWidth,
      child: DropdownButtonFormField<String>(
        // alignment: alignment,

        value: controller.text.isNotEmpty ? controller.text : null,
        items: [
          DropdownMenuItem<String>(
            value: 'default',
            // alignment: alignment,
            child: defaultOptionTextWidget ??
                AppTextWidget(
                  text: defaultOptionText,
                  style: TextStyle(
                    fontSize: AppDimensions.fontSize14,
                    color: Colors.grey,
                  ),
                ),
          ),
          ...optionsList.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              // alignment: alignment,
              child: optionsTextWidget ??
                  AppTextWidget(
                    text: value,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSize14,
                    ),
                  ),
            );
          }),
        ],
        onChanged: (value) {
          if (value != null) {
            controller.text = value;
          }
        },
        icon: buttonIconWidget ?? const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffix: suffix,
          prefixIcon: prefixIcon,
        ),

        dropdownColor: dropDownBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: dropDownBorderRadius.isNotEmpty ? Radius.circular(dropDownBorderRadius[0]) : Radius.zero,
          topRight: dropDownBorderRadius.length > 1 ? Radius.circular(dropDownBorderRadius[1]) : Radius.zero,
          bottomLeft: dropDownBorderRadius.length > 2 ? Radius.circular(dropDownBorderRadius[2]) : Radius.zero,
          bottomRight: dropDownBorderRadius.length > 3 ? Radius.circular(dropDownBorderRadius[3]) : Radius.zero,
        ),
      ),
    );
  }
}
