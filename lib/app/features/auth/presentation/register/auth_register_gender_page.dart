import 'package:bistro/app/features/auth/presentation/register/routing/auth_register_routing.dart';
import 'package:bistro/app/features/auth/presentation/register/widgets/views/auth_register_error_layout_view.dart';
import 'package:bistro/app/features/auth/presentation/register/widgets/views/app_gender_switch_button_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/features/auth/presentation/register/auth_register_page.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'providers/auth_register_controller_provider.dart';
import 'providers/auth_register_error_provider.dart';
import 'widgets/views/auth_register_button_view.dart';

class AuthRegisterGenderPage extends ConsumerWidget {
  const AuthRegisterGenderPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final gender = ref.watch(authRegisterControllerProvider.select((state) => state.gender));
    final controller = ref.watch(authRegisterControllerProvider.notifier);
    final genderError=ref.watch(authRegisterErrorProvider('gender'));

    return AuthRegisterPage(
      widget: [
        AppTextWidget(
          text: context.localizations.whatIsYourGender,
          fontSize: AppDimensions.fontSize24,
          color: AppColors.black01,
          maxLines: 3,
          fontWeight: FontWeight.w600,
        ),
        Gap(AppDimensions.gap10h),
        AppTextWidget(
          text: context.localizations.chooseYourGenderByClickingOn,
          fontSize: AppDimensions.fontSize14,
          color: AppColors.black01,
          maxLines: 4,
        ),
        Gap(AppDimensions.gap20h),
        AppGenderSwitchButtonView(
          selectedGender: gender,
          onChanged: (value) {
            controller.updateGender(value: value);
          },
        ),
        if (genderError != null) ...[
          Gap(AppDimensions.gap20h),
          RegisterErrorLayoutView(
            text: genderError,
          )
        ],
        Gap(AppDimensions.gap30h),
        AuthRegisterButtonView(
          onPressed: () {
            controller.validationGenderPage(context);
          },
        ),
      ],
    );
  }
}
