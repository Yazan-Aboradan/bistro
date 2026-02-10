import 'package:bistro/app/features/auth/presentation/register/routing/auth_register_routing.dart';
import 'package:bistro/app/features/auth/presentation/register/widgets/views/auth_register_error_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../domain/auth_apis.dart';
import '../login/providers/login_controller_provider.dart';
import '../login/providers/login_error_provider.dart';
import 'providers/auth_register_controller_provider.dart';
import 'providers/auth_register_error_provider.dart';
import 'auth_register_page.dart';

import 'package:bistro/app/global_widgets/app_row_widget.dart';
import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widgets/views/auth_register_country_code_field_view.dart';
import 'widgets/views/auth_register_button_view.dart';
import 'widgets/views/auth_register_phone_number_text_field_view.dart';
import 'widgets/views/auth_register_verify_phone_number_text_field_view.dart';

class AuthRegisterPhoneNumberPage extends HookConsumerWidget {
  const AuthRegisterPhoneNumberPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final controller = ref.read(authRegisterControllerProvider.notifier);
    final state = ref.watch(authRegisterControllerProvider);

    final phoneNumberError = ref.watch(authRegisterErrorProvider('phoneNumber'));
    final verifyPhoneNumberError = ref.watch(authRegisterErrorProvider('verifyPhoneNumber'));
    final phoneNumberAndVerifyPhoneNumberError = ref.watch(authRegisterErrorProvider('phoneNumberAndVerifyPhoneNumber'));
    final registerServerSideError = ref.watch(authRegisterErrorProvider('registerServerSideError'));
    final registerUserSideError = ref.watch(authRegisterErrorProvider('registerUserSideError'));
    final isLoading = ref.watch(
      authRegisterControllerProvider.select(
        (value) => value.isLoading,
      ),
    );

    return AuthRegisterPage(
      widget: [
        AppTextWidget(
          text: context.localizations.whatIsYourPhoneNumber,
          fontSize: AppDimensions.fontSize24,
          color: AppColors.black01,
          maxLines: 3,
          fontWeight: FontWeight.w600,
        ),
        Gap(AppDimensions.gap10h),
        AppTextWidget(
          text: context.localizations.rememberYourPhone,
          fontSize: AppDimensions.fontSize14,
          color: AppColors.black01,
          maxLines: 8,
        ),
        Gap(AppDimensions.gap20h),
        AppRowWidget(
          children: [
            AuthRegisterCountryCodeFieldView(
              onChange: (value) {
                print("Country code changed to: $value");
                // You can also trigger validation or next logic here
              },
            ),
            Expanded(
              child: AuthRegisterPhoneNumberTextFieldView(),
            ),
          ],
        ),
        Gap(AppDimensions.gap20h),
        AppRowWidget(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AuthRegisterCountryCodeFieldView(
              onChange: (value) {
                print("Country code changed to: $value");
                // You can also trigger validation or next logic here
              },
            ),
            Expanded(child: AuthRegisterVerifyPhoneNumberTextFieldView()),
          ],
        ),
        if (phoneNumberError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: phoneNumberError,
          ),
        ],
        if (verifyPhoneNumberError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: verifyPhoneNumberError,
          ),
        ],
        if (phoneNumberAndVerifyPhoneNumberError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: phoneNumberAndVerifyPhoneNumberError,
          ),
        ],
        if (registerServerSideError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: registerServerSideError,
          ),
        ],
        if (registerUserSideError != null) ...[
          Gap(AppDimensions.gap10h),
          RegisterErrorLayoutView(
            text: registerUserSideError,
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
              if (controller.validationPhoneNumberPage(context)) {
                ref.read(authRegisterControllerProvider.notifier).updateIsLoading(value: true);

                final isValid = await AuthApis().validatePhoneNumber(state.phoneNumber, ref, context);
                ref.read(authRegisterControllerProvider.notifier).updateIsLoading(value: false);

                if (isValid) {
                  controller.updateFieldError('registerUserSideError',null);
                  controller.updateFieldError('registerServerSideError',null);
                  context.registerToPrivacyAndPolicy();
                }
              }
            },
          ),
        ],
      ],
    );
  }
}
