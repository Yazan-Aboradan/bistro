import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../l10n/providers/locale_provider.dart';
import '../../../../../core/values/app_colors.dart' show AppColors;
import '../../products_controller.dart';
import '../../providers/category_filtering_index_provider.dart';
import '../product_widget_02.dart';

class ProductsContentProductsListView extends ConsumerWidget {
  final String categoryId;

  const ProductsContentProductsListView({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSubCategory = ref.watch(categoriesFilteringIndexProvider);
    final lang = ref.watch(localeProvider).languageCode;

    final asyncProducts = ref.watch(
      productsProvider(
        ProductsQuery(
          categoryId: categoryId,
          selectedSubCategory: selectedSubCategory,
          lang: lang,
        ),
      ),
    );

    return asyncProducts.when(
      data: (products) {
        if (products.isEmpty) {
          return const Center(child: Text('No products found'));
        }
        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.gap12w,
            vertical: AppDimensions.gap12h,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: ProductWidget02(product: product),
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}

final productsProvider = FutureProvider.autoDispose.family<List<Product>, ProductsQuery>((ref, query) async {
  if (query.selectedSubCategory == 'all') {
    return ProductsController().fetchProductsByCategory(
      lang: query.lang,
      categoryId: query.categoryId,
    );
  } else {
    return ProductsController().fetchProductsBySubCategory(
      lang: query.lang,
      categoryId: query.selectedSubCategory,
    );
  }
});

class ProductsQuery {
  final String categoryId;
  final String selectedSubCategory;
  final String lang;

  ProductsQuery({
    required this.categoryId,
    required this.selectedSubCategory,
    required this.lang,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductsQuery &&
              runtimeType == other.runtimeType &&
              categoryId == other.categoryId &&
              selectedSubCategory == other.selectedSubCategory &&
              lang == other.lang;

  @override
  int get hashCode => categoryId.hashCode ^ selectedSubCategory.hashCode ^ lang.hashCode;
}
