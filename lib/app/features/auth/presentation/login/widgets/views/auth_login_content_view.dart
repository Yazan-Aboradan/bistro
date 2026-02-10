import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/login_error_provider.dart';
import 'auth_login_error_layout_view.dart';
import 'auth_login_background_view.dart';
import 'auth_login_content_logo_view.dart';
import 'auth_login_content_login_layout_view.dart';
import 'auth_login_content_login_button_view.dart';
import 'auth_login_content_phone_number_text_field_view.dart';
import 'auth_login_content_to_register_button_view.dart';
import 'package:bistro/app/global_widgets/app_column_widget.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';

class AuthLoginContentView extends ConsumerWidget {
  const AuthLoginContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Stack(
      children: [
        AuthLoginBackgroundView(),
        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: AppColumnWidget(
              // width: screenWidth > 700 ? 700 : screenWidth,
              children: [
                // Logo
                AuthLoginContentLogoView(),
                // Space
                Gap(AppDimensions.gap20h),
                // Phone number textLayout
                AuthLoginContentAuthLoginLayoutView(),
                // Space
                Gap(AppDimensions.gap20h),
                // Phone Number textField
                AuthLoginContentPhoneNumberTextFieldView(),
                // Space
                Gap(AppDimensions.gap20h),
                // Error
                if (ref.watch(AuthLoginErrorProvider) != null) ...[
                  AuthLoginErrorLayoutView(text: ref.watch(AuthLoginErrorProvider)!),
                ],
                //Space
                Gap(AppDimensions.gap20h),
                // AuthLogin Button
                AuthLoginContentLoginButtonView(),
                // Space
                Gap(AppDimensions.gap20h),
                // Register Button
                AuthLoginContentToRegisterButtonView(),
            
                // Bottom Navigation bar
              ],
            ),
          ),
        ),
      ],
    );
    // Bottom nav bar
  }
}
