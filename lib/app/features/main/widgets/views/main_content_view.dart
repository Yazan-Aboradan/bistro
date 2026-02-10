import 'package:flutter/material.dart';

import 'package:bistro/app/features/products/presentation/widgets/views/categories_list_view.dart';


class MainContentView extends StatelessWidget {
  const MainContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CategoriesListView();
  }
}
