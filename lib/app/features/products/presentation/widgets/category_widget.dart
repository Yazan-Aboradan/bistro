import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/features/main/routing/main_routing.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';
import 'package:bistro/app/global_widgets/app_image_widget.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_material_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/categories_apis.dart';
import '../providers/categories_selected_name_provider.dart';
import '../providers/category_filtering_index_provider.dart';

class CategoryWidget extends ConsumerWidget {
  final Category category;
  final double fontSize;

  const CategoryWidget({
    super.key,
    required this.category,
    required this.fontSize,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final backgroundColor = category.isBackgroundGreen! ? AppColors.primary : AppColors.secondary;
    final fontColor = category.isBackgroundGreen! ? AppColors.secondary : AppColors.primary;
    final bool isRight = category.isSvgRight!;
    return GestureDetector(
      onTap: () {
        ref.read(categoriesFilteringIndexProvider.notifier).state = 'all';
        context.mainToCategory(
          category.id,
        );
        ref.read(categoriesSelectedNameProvider.notifier).state = category.name;
      },
      child: AppMaterialWidget(
        elevation: 20,
        child: AppContainerWidget(
          backgroundColor: backgroundColor,
          child: Stack(
            children: [

              PositionedDirectional(
                end: isRight ? 0 : null,
                start: isRight ? null : 0,
                bottom: 0,
                child: AppImageWidget(
                  width: 40,
                  height: 40,
                  path :category.isBackgroundGreen! ? category.whiteSvgPath : category.greenSvgPath,
                ),
              ),
              Center(
                child: AppTextWidget(
                  text: category.name,
                  style: TextStyle(
                    color: fontColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
