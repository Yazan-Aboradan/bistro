import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:flutter/material.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/features/auth/presentation/login/routing/login_routing.dart';
import 'package:bistro/app/global_widgets/app_clickable_text_widget.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';

class AuthLoginContentToRegisterButtonView extends StatelessWidget {
  const AuthLoginContentToRegisterButtonView({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final _width = MediaQuery.of(context).size.width;
    return _width >300 ?AppRowWidget(
      children: [
        AppTextWidget(
          textAlign: TextAlign.center,
          text: '${context.localizations.uDontHaveAnAccount} ',
          color: AppColors.gray03,
          fontSize: AppDimensions.fontSize16,
        ),
        AppClickableTextWidget(
          textWidget: AppTextWidget(
            text: context.localizations.create,
            maxLines: 3,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: AppColors.primary,
              decorationThickness: 1,
              color: AppColors.primary,
              fontSize: AppDimensions.fontSize18,
            ),
          ),
          onTap: () {
            context.loginToRegister();
          },
        ),
      ],
    ):AppColumnWidget(children: [AppTextWidget(
      text: '${context.localizations.uDontHaveAnAccount} ',
      color: AppColors.gray03,
      fontSize: AppDimensions.fontSize16,
    ),
      AppClickableTextWidget(
        textWidget: AppTextWidget(
          text: context.localizations.create,
          maxLines: 3,
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            decorationColor: AppColors.primary,
            decorationThickness: 2,
            color: AppColors.primary,
            height: 1.5,
            fontSize: AppDimensions.fontSize18,
          ),
        ),
        onTap: () {
          context.loginToRegister();

        },
      ),]);
  }
}
