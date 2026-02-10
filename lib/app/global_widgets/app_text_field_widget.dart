import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/values/app_colors.dart';
import '../features/auth/presentation/register/auth_register_name_page.dart';

class AppTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  final String? inputFormatters;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final bool obscureText;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final List<double> padding;
  final List<double> borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color focusedBorderColor;
  final Color cursorColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isBottomBordered;
  final bool hasSuffix;
  final bool readOnly;
  final double? width;
  final bool autofocus;
  final TextStyle? errorStyle;
  final bool isError;
  final TextInputType? keyboardType;

  const AppTextFieldWidget({
    super.key,
    this.inputFormatters,
    required this.textEditingController,
    this.hintText,
    this.inputDecoration,
    this.obscureText = false,
    this.textStyle,
    this.hintStyle,
    this.backgroundColor = AppColors.defaultColor,
    this.padding = const [],
    this.borderRadius = const [],
    this.borderColor = AppColors.defaultColor,
    this.borderWidth = 0.5,
    this.focusedBorderColor = AppColors.defaultColor,
    this.suffixIcon,
    this.prefixIcon,
    this.cursorColor = AppColors.gray01,
    this.isBottomBordered = false,
    this.hasSuffix = false,
    this.readOnly = false,
    this.width,
    this.focusNode,
    this.autofocus = false,
    this.isError = false,
    this.errorStyle,
    this.keyboardType,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final Map<String, TextInputFormatter> formatters = {
      'all': FilteringTextInputFormatter.allow(RegExp(r'[ -~]')), // All printable ASCII chars
      'englishLetters': FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
      'letters': FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\u0600-\u06FF]')),
      'arabicLetters': FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF]+')),
      'digits': FilteringTextInputFormatter.allow(RegExp(r'\d')),
      'symbols': FilteringTextInputFormatter.allow(RegExp(r'[^\w\s]')), // Symbols only (no letters/digits)
      'lettersAndDigits': FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
      'lettersAndSpaces': FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\u0600-\u06FF\s]')),
      'noDigits': FilteringTextInputFormatter.allow(RegExp(r'[^\d]')),
      'noLetters': FilteringTextInputFormatter.allow(RegExp(r'[^a-zA-Z]')),
    };

    return AppContainerWidget(
      width: width,
      child: TextField(
        // autofocus: autofocus,
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        obscureText: obscureText,
        readOnly: readOnly,
        focusNode: focusNode,
        keyboardType: keyboardType ?? TextInputType.name,
        decoration: inputDecoration ??
            InputDecoration(
              // errorMaxLines: 3,
              // // Key change here: show empty string to trigger error border but hide message
              // errorText: isError ? '' : null,
              // errorStyle: errorStyle ??
              //     TextStyle(
              //       height: 0, // Makes sure no vertical space for error text
              //       color: Colors.transparent, // Hide text if any
              //     ),
              isDense: true,
              contentPadding: EdgeInsets.only(
                left: padding.isNotEmpty ? padding[0] : 0,
                top: padding.length > 1 ? padding[1] : 0,
                right: padding.length > 2 ? padding[2] : 0,
                bottom: padding.length > 3 ? padding[3] : 0,
              ),
              filled: true,
              fillColor: backgroundColor,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: !isBottomBordered
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
                        topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
                        bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
                        bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: isError ? Colors.red : borderColor,
                        width: borderWidth,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
                        topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
                        bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
                        bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: isError ? Colors.red : borderColor,
                        width: borderWidth,
                      ),
                    ),
              enabledBorder: !isBottomBordered
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
                        topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
                        bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
                        bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: isError ? Colors.red : borderColor,
                        width: borderWidth,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
                        topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
                        bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
                        bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: isError ? Colors.red : borderColor,
                        width: borderWidth,
                      ),
                    ),
              focusedBorder: !isBottomBordered
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
                        topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
                        bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
                        bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: focusedBorderColor,
                        width: borderWidth,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
                        topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
                        bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
                        bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
                      ),
                      borderSide: BorderSide(
                        color: focusedBorderColor,
                        width: borderWidth,
                      ),
                    ),
              // errorBorder: !isBottomBordered
              //     ? OutlineInputBorder(
              //   borderRadius: BorderRadius.only(
              //     topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
              //     topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
              //     bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
              //     bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
              //   ),
              //   borderSide: BorderSide(
              //     color: Colors.red,
              //     width: borderWidth,
              //   ),
              // )
              //     : UnderlineInputBorder(
              //   borderRadius: BorderRadius.only(
              //     topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
              //     topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
              //     bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
              //     bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
              //   ),
              //   borderSide: BorderSide(
              //     color: Colors.red,
              //     width: borderWidth,
              //   ),
              // ),
              // focusedErrorBorder: !isBottomBordered
              //     ? OutlineInputBorder(
              //   borderRadius: BorderRadius.only(
              //     topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
              //     topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
              //     bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
              //     bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
              //   ),
              //   borderSide: BorderSide(
              //     color: Colors.red,
              //     width: borderWidth,
              //   ),
              // )
              //     : UnderlineInputBorder(
              //     borderRadius: BorderRadius.only(
              //           topLeft: borderRadius.isNotEmpty ? Radius.circular(borderRadius[0]) : Radius.zero,
              //           topRight: borderRadius.length > 1 ? Radius.circular(borderRadius[1]) : Radius.zero,
              //           bottomLeft: borderRadius.length > 2 ? Radius.circular(borderRadius[2]) : Radius.zero,
              //           bottomRight: borderRadius.length > 3 ? Radius.circular(borderRadius[3]) : Radius.zero,
              //         ),
              //         borderSide: BorderSide(
              //           color: Colors.red, // Focused error border color
              //           width: borderWidth,
              //         ),
              //       ),
              hintStyle: hintStyle ??
                  const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
            ),
        style: textStyle ??
            TextStyle(
              // Style for input text
              fontSize: 16,
            ),
        cursorColor: cursorColor,
        inputFormatters: inputFormatters != null && formatters.containsKey(inputFormatters)
            ? [formatters[inputFormatters]!]
            : [FilteringTextInputFormatter.allow(RegExp(r'[ -~]'))],
      ),
    );
  }
}
