import 'package:flutter/material.dart';

import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:gap/gap.dart';

import 'widgets/views/products_content_view.dart';
import 'widgets/views/products_header_view.dart';

class ProductsContent extends StatelessWidget {
  final String categoryId;

  const ProductsContent({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return AppColumnWidget(
      backgroundColor: AppColors.backgroundColor,
      children: [
        CategoriesHeaderView(
        ),
        Gap(12),
        Expanded(
          child: ProductsContentView(categoryId: categoryId,),
        ),
      ],
    );
  }
}
