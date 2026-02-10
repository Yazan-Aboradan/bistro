import 'package:flutter/material.dart';

import 'package:bistro/app/features/headers/presentation/widgets/views/headers_header02_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/categories_selected_name_provider.dart';

class CategoriesHeaderView extends ConsumerWidget {

  const CategoriesHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final categoryName = ref.read(categoriesSelectedNameProvider);
    return  HeadersHeader02View(
      categoryName: categoryName,
    );
  }
}
