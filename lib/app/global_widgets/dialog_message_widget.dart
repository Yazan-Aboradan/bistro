import 'package:bistro/app/global_widgets/app_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'dart:ui';

class BlurredPage extends StatelessWidget {
  final Color? color;
  final double? opacity;

  const BlurredPage({
    super.key,
    this.color = AppColors.secondary,
    this.opacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () {
          // Close the dialog using GoRouter
          GoRouter.of(context).pop();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            // color: color!.withValues(alpha: opacity),
            color: color!.withValues(alpha : opacity),

          ),
        ),
      ),
      // Centered dialog box content
    );
  }
}

void ShowDialogMessage({
  required BuildContext context,
  required Widget? widget,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          BlurredPage(),
          _DialogBoxWidget(
            widget: widget,
          ),
        ],
      );
    },
  );
}

class _DialogBoxWidget extends StatelessWidget {
  final Widget? widget;

  const _DialogBoxWidget({
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: AppContainerWidget(
            child: widget!,
          )),
    );
  }
}
