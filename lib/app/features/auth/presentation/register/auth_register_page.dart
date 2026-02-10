import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:bistro/app/features/headers/presentation/widgets/views/headers_back_button_view.dart';
import 'package:go_router/go_router.dart';

// import 'register_content.dart';

class AuthRegisterPage extends StatelessWidget {
  final List<Widget> widget;

  const AuthRegisterPage({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        child: AppColumnWidget(
          mainAxisAlignment: MainAxisAlignment.start,
          padding: [
            AppDimensions.gap20w,
            AppDimensions.gap20h,
            AppDimensions.gap20w,
            AppDimensions.gap20h,
          ],
          children: [
            AppRowWidget(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeadersBackButtonView(color: AppColors.black01, onClick: () {
                  context.pop();
                },),
              ],
            ),
            Gap(AppDimensions.gap20h),
            AppColumnWidget(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget,
            ),
          ],
        ),
      ),
    );
  }
}
