import 'app_image_widget.dart';
import 'package:flutter/material.dart';

import '../core/values/app_colors.dart';
import '../core/values/app_dimensions.dart';

class AppAvatarWidget extends StatelessWidget {
  final String imageUrl;
  final bool isStatusShown;
  final Color statusColor;
  final bool isBordered;
  final Color borderColor;
  final double borderThickness;
  final double radius;
  final double? borderRadius;

  const AppAvatarWidget({
    super.key,
    required this.imageUrl,
    this.isStatusShown = false,
    this.statusColor = AppColors.green01,
    this.isBordered = false,
    this.borderColor = AppColors.primary,
    this.borderThickness = 2.0,
    this.radius = AppDimensions.radius20,
    this.borderRadius,
  }) : assert(
          radius > borderThickness,
          'Radius must be gerater than',
        );

  @override
  Widget build(BuildContext context,) {
    final imageRadius = isBordered ? radius - borderThickness : radius;

    return Stack(
      children: [
        // Background & Image
        CircleAvatar(
          radius: radius,
          backgroundColor: borderColor,
          child: CircleAvatar(
            radius: imageRadius,
            backgroundColor: AppColors.gray01,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                borderRadius ?? imageRadius,
              ),
              child: AppImageWidget(
                path: imageUrl,
                width: imageRadius * 2,
                height: imageRadius * 2,
              ),
            ),
          ),
        ),

        // Status
        if (isStatusShown)
          PositionedDirectional(
            end: AppDimensions.zero,
            bottom: AppDimensions.zero,
            child: Container(
              width: AppDimensions.width15,
              height: AppDimensions.height15,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: AppDimensions.thickness02,
                  color: AppColors.white01,
                ),
              ),
            ),
          )
      ],
    );
  }
}
