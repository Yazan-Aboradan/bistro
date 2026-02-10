import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/features/products/presentation/widgets/product_details_widget.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../global_widgets/app_image_widget.dart';
import '../../../../global_widgets/app_row_widget.dart';
import '../../../../global_widgets/app_text_widget.dart';
import '../products_controller.dart';

class ProductWidget02 extends StatelessWidget {
  final Product product;

  const ProductWidget02({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: GestureDetector(
        onTap: () {
          showProductPopUP(context: context, product: product);

        },
        child: AppRowWidget(
          backgroundColor: AppColors.secondary,
          isBordered: true,
          borderWidth: 0.5,
          borderColor: AppColors.primary.withOpacity(0.8),
          children: [
            AppImageWidget(
              path: product.imagePath != '' ? product.imagePath : product.category.greenSvgPath,
              width: 130,
              height: 80
            ),
            Gap(10),
            Expanded(
              child: AppColumnWidget(
                height: 80,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppRowWidget(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppTextWidget(
                          text: product.name,
                          style: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                      ),
                      Gap(5),
                      AppTextWidget(
                        text: '${product.price} ${context.localizations.syp}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  AppTextWidget(
                    text: product.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.gray02,
                    ),
                    maxLines: 1,
                  ),
                  AppTextWidget(
                    text: product.ingredients.map((i) => i.name).join(' - '),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.gray02,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
