import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'providers/auth_register_controller_provider.dart';
import 'auth_register_page.dart';
import 'providers/auth_register_error_provider.dart';
import 'widgets/views/auth_register_last_name_text_field_view.dart';
import 'widgets/views/auth_register_first_name_text_field_view.dart';
import 'widgets/views/auth_register_button_view.dart';
import 'widgets/views/auth_register_error_layout_view.dart';

class AuthRegisterNamePage extends ConsumerWidget {
  const AuthRegisterNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(authRegisterControllerProvider.notifier);
    final firstNameError=ref.watch(authRegisterErrorProvider('firstName'));
    final lastNameError=ref.watch(authRegisterErrorProvider('lastName'));
    final firstNameAndLastNameError=ref.watch(authRegisterErrorProvider('firstNameAndLastName'));

    return AuthRegisterPage(
      widget: [

        AppTextWidget(
          text: context.localizations.whatIsYourName,
          fontSize: AppDimensions.fontSize24,
          color: AppColors.black01,
          maxLines: 3,
          fontWeight: FontWeight.w600,
        ),
        Gap(AppDimensions.gap10h),
        AppTextWidget(
          text: context.localizations.enterTheNameYouUseInRealLife,
          fontSize: AppDimensions.fontSize14,
          color: AppColors.black01,
          maxLines: 3,
        ),
        Gap(AppDimensions.gap20h),
        AppRowWidget(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: AuthRegisterFirstNameTextFieldView()),
            Gap(AppDimensions.gap20w),
            Expanded(child: AuthRegisterLastNameTextFieldView()),
          ],
        ),

        if (firstNameError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: firstNameError,
          ),
        ],
        if (lastNameError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: lastNameError,
          ),
        ],
        if (firstNameAndLastNameError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: firstNameAndLastNameError,
          ),
        ],
        Gap(AppDimensions.gap30h),
        AuthRegisterButtonView(onPressed: () {
          controller.validationNamePage(context);
        }),
      ],
    );
  }
}


