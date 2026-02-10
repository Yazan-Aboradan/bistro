import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:bistro/app/global_widgets/app_icon_widget.dart';
import 'package:bistro/app/global_widgets/app_image_widget.dart';
import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';


class AppCardWidget extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String? description;
  final String? price;
  final double elevation;
  final void Function()? onTap;
  final String? categoryPath;

  const AppCardWidget({
    super.key,
    required this.title,
    this.imagePath,
    this.description,
    this.price,
    this.categoryPath,
    this.onTap,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: elevation,
        child: AppColumnWidget(
          backgroundColor: AppColors.secondary,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 8,
                child: AppImageWidget(
                  path: imagePath!,
                  fit: BoxFit.cover,
                )),
            Expanded(
              flex: 5,
              child: AppColumnWidget(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                padding: [
                  AppDimensions.gap10w,
                  AppDimensions.gap10h,
                  AppDimensions.gap10w,
                  AppDimensions.gap10h,
                ],
                children: [
                  AppTextWidget(
                    text: title,
                    fontSize: price != null ? AppDimensions.fontSize14 : AppDimensions.fontSize18,
                    fontWeight: FontWeight.w700,
                    maxLines: 1,
                  ),
                  AppRowWidget(
                    padding: [AppDimensions.gap06w, 0, AppDimensions.gap06w, 0],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      price != null
                          ? AppTextWidget(
                              text: price!,
                              fontWeight: FontWeight.w700,
                              fontSize: AppDimensions.fontSize16,
                            )
                          : AppTextWidget(
                              text: context.localizations.clickForDetails,
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.fontSize16,
                              color: AppColors.gray02,
                            ),
                      AppIconWidget(
                        color: AppColors.gray02,
                        iconData: Icons.chevron_right_sharp,
                        size: AppDimensions.iconSize24,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
