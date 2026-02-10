import 'package:flutter/material.dart';

import 'products_content.dart';

class ProductsPage extends StatelessWidget {
  final String categoryId;

  const ProductsPage({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsContent(
        categoryId: categoryId,
      ),
    );
  }
}
