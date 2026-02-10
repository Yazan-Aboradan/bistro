import 'package:flutter/material.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';


class AppClickableTextWidget extends StatelessWidget {
  final AppTextWidget textWidget;
  final void Function() onTap;

  const AppClickableTextWidget({
    super.key,
    required this.textWidget,
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Change cursor to pointer on hover
      child: GestureDetector(
        onTap: onTap,
        child: textWidget,
      ),
    );
  }
}
