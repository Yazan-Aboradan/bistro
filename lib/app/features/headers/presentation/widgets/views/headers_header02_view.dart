import 'package:flutter/material.dart';

import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_container_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'headers_back_button_view.dart';
import 'headers_title_view.dart';

class HeadersHeader02View extends ConsumerWidget {
  final String categoryName;

  const HeadersHeader02View({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(
    BuildContext context,
      WidgetRef ref,
  ) {
    return AppContainerWidget(
      padding: [
        AppDimensions.gap12w,
        AppDimensions.gap20h,
        AppDimensions.gap12w,
        AppDimensions.gap20h,
      ],
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: HeadersBackButtonView(),
          ),
          Center(
            child: HeadersTitleView(
              text: categoryName,
            ),
          ),
        ],
      ),
      // message and userName
    );
  }
}
