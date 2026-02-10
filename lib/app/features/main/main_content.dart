import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:bistro/app/core/values/app_dimensions.dart';
import 'widgets/views/main_content_view.dart';
import 'widgets/views/main_header_view.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppColumnWidget(
      children: [
        // Main Header
         MainHeaderView(),
        //Main Content
        Gap(AppDimensions.gap50h),
        Expanded(
          child: MainContentView(),
        ),
      ],
    );
  }
}
