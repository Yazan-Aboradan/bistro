import 'package:flutter/material.dart';

import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';
import 'package:bistro/app/global_widgets/app_icon_widget.dart';
import 'package:bistro/app/global_widgets/app_image_widget.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../global_pages/blurred_page.dart';
import '../products_controller.dart';

void showProductPopUP({
  required BuildContext context,
  required Product product,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return _DialogMessageWidget(
        product: product,
      );
    },
  );
}

class _DialogMessageWidget extends StatelessWidget {
  final Product product;

  const _DialogMessageWidget({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurredPage(),
        _DialogBoxWidget(
          product: product,
        ),
      ],
    );
  }
}

class _DialogBoxWidget extends ConsumerWidget {
  final Product product;

  const _DialogBoxWidget({
    required this.product,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    // final isAvailable = product.isAvailable;
    // final widthh = MediaQuery.of(context).size.width;
    // final heightt = MediaQuery.of(context).size.height;
    // final double width, height = 420;
    // if (widthh <= 400) {
    //   width = widthh - 40;
    // } else {
    //   width = 360;
    // }
    double calculateTextHeight(String text, double maxWidth, {int? maxLines}) {
      final tp = TextPainter(
        text: TextSpan(text: text,),
        textDirection: TextDirection.ltr,
        maxLines: maxLines,
      );
      tp.layout(maxWidth: maxWidth);
      return tp.size.height;
    }
    return Center(
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 30),
        // remove outer margin around dialog
        contentPadding: EdgeInsets.zero,
        // remove padding around content
        backgroundColor: AppColors.defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),

        content: AppContainerWidget(
        width: 400,
        height: 420 + calculateTextHeight(product.description + product.ingredients.map((i) => i.name).join('  -  '),400),
        child: Stack(
          children: [
            AppColumnWidget(
              backgroundColor: AppColors.backgroundColor,
              children: [
                Expanded(
                  flex: 4,
                  child: AppImageWidget(
                    path: product.imagePath == '' ? product.category.greenSvgPath : product.imagePath,
                    width: 400,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AppColumnWidget(
                    padding: [30, 10, 30, 10],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTextWidget(
                        text: product.name,
                        style: TextStyle(
                          fontSize: AppDimensions.fontSize20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if(product.ingredients!=null && product.ingredients.length!=0)...[
                        Gap(12),
                        AppTextWidget(
                          textAlign: TextAlign.center,
                          text: product.ingredients.map((i) => i.name).join('  -  '),
                          style: TextStyle(fontSize: AppDimensions.fontSize14, fontWeight: FontWeight.w400, color: AppColors.gray03),
                        ),
                      ],
                      Gap(12),
                      AppTextWidget(
                        textAlign: TextAlign.center,

                        text: product.description,
                        style: TextStyle(fontSize: AppDimensions.fontSize14,fontWeight: FontWeight.w400,color: AppColors.gray03),
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //PositionedDirectional(
            //                 bottom: 10, // distance from the right edge
            //                 // top: MediaQuery.of(context).size.height * 0.25, // adjust vertical position
            //                 child: AppContainerWidget(
            //                   width: 60,
            //                   height: 25,
            //                   padding: [4,4,4,4],
            //                   backgroundColor: AppColors.defaultColor,
            //                   child: Center(
            //                     child: AppTextWidget(
            //                       text: '${product.price}',
            //                       fontSize: 8,
            //                       maxLines: 1,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            Positioned(
              top: AppDimensions.gap08h,
              right: AppDimensions.gap08w,
              child: AppIconWidget(
                size: AppDimensions.iconSize26,
                iconData: Icons.close,
                backgroundColor: AppColors.secondary,
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}