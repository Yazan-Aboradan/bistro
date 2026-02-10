import 'package:bistro/app/features/auth/presentation/register/routing/auth_register_routing.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../global_widgets/app_row_widget.dart';
import '../../domain/auth_apis.dart';
import '../../domain/entities/user.dart';
import 'providers/auth_register_controller_provider.dart';
import 'auth_register_page.dart';
import 'providers/auth_register_error_provider.dart';
import 'widgets/views/auth_register_button_view.dart';
import 'widgets/views/auth_register_error_layout_view.dart';

class AuthRegisterPrivacyAndPolicyPage extends ConsumerWidget {
  const AuthRegisterPrivacyAndPolicyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authRegisterControllerProvider);
    final registerError = ref.watch(authRegisterErrorProvider('registerError'));
    final isLoading = ref.watch(
      authRegisterControllerProvider.select(
            (value) => value.isLoading,
      ),
    );

    return AuthRegisterPage(
      widget: [
        AppTextWidget(
          text: context.localizations.thanks_name_for_your_time(state.firstName.trim()),
          fontSize: AppDimensions.fontSize28,
          color: AppColors.black01,
          maxLines: 3,
          fontWeight: FontWeight.w600,
        ),
        Gap(AppDimensions.gap10h),
        AppTextWidget(
          text: context.localizations.allDataBeenCollectedWillBePrivate,
          fontSize: AppDimensions.fontSize24,
          color: AppColors.black01,
          maxLines: 10,
        ),
        if (registerError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: registerError,
          ),
        ],
        Gap(AppDimensions.gap30h),
        if (isLoading) ...[
          AppRowWidget(
            children: [
              CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ],
          ),
        ] else ...[
          AuthRegisterButtonView(
            onPressed: () async {
              final user = User(
                  firstName: state.firstName.trim(),
                  lastName: state.lastName.trim(),
                  birthday: state.birthday,
                  gender: state.gender,
                  phoneNumber: state.phoneNumber,
                  language: state.language,
                  countryCode: state.countryCode);
              ref.read(authRegisterControllerProvider.notifier).updateIsLoading(value: true);

              final success = await AuthApis().registerUser(user);
              ref.read(authRegisterControllerProvider.notifier).updateIsLoading(value: false);

              if (success) {
                ref.read(authRegisterErrorProvider('registerError').notifier).state = null;
                context.registerToLogin();
              } else {
                ref.read(authRegisterErrorProvider('registerError').notifier).state = context.localizations.registerServerSideError;
              }

            },
            text: context.localizations.accept,
          ),
        ],
      ],
    );
  }
}
