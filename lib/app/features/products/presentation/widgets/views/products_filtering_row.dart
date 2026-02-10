import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_button_widget.dart';
import 'package:bistro/app/global_widgets/app_material_widget.dart';
import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:bistro/extra/fake_data.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/categories_provider.dart';
import '../../providers/category_filtering_index_provider.dart';

class ProductsFilteringRow extends ConsumerWidget {
  final String parentId;

  const ProductsFilteringRow({
    super.key,
    required this.parentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSubcategories = ref.watch(subcategoriesProvider(parentId));

    return asyncSubcategories.when(
      data: (subCategories) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AppRowWidget(
            padding: const [12, 0, 12, 0],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryButton(id: 'all', text: context.localizations.all),
              const Gap(15),
              for (final sub in subCategories) ...[
                CategoryButton(id: sub.id, text: sub.name),
                const Gap(15),
              ],
            ],
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (err, stack) =>
          Center(child: Text('❌ Failed to load categories: $err')),
    );
  }
}


class CategoryButton extends ConsumerWidget {
  final String id;
  final String text;

  const CategoryButton({required this.id, required this.text, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(categoriesFilteringIndexProvider);
    final isSelected = selectedCategoryId == id;
    return AppMaterialWidget(
      elevation: 3,
      child: AppButtonWidget(
        paddingH: 8,
        text: text,
        backgroundColor: isSelected ? AppColors.primary.withOpacity(0.9) : AppColors.secondary,
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: isSelected ? AppColors.secondary : AppColors.primary,
        ),
        onPressed: () {
          ref.read(categoriesFilteringIndexProvider.notifier).state = id;
        },
      ),
    );
  }
}
