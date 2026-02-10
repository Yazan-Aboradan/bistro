import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/category_filtering_index_provider.dart';
import 'products_content_products_list_view.dart';
import 'products_filtering_row.dart';

class ProductsContentView extends ConsumerWidget {
  final String categoryId;

  const ProductsContentView({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppColumnWidget(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductsFilteringRow(
          parentId: categoryId,
        ),
        Gap(20),
        Expanded(
          child: ProductsContentProductsListView(
            categoryId: categoryId,
          ),
        ),
      ],
    );
  }
}
