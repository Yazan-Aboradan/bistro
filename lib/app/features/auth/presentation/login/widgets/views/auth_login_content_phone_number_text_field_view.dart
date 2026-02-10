import 'package:flutter/material.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_field_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../hooks/login_phone_number_hook.dart';
import '../../providers/login_error_provider.dart';

class AuthLoginContentPhoneNumberTextFieldView extends HookConsumerWidget {
  const AuthLoginContentPhoneNumberTextFieldView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberTextEditingController = useLoginPhoneNumber(
      ref: ref,
    );
    return AppTextFieldWidget(
      textEditingController: phoneNumberTextEditingController,
      backgroundColor: AppColors.secondary,
      hintText: context.localizations.phoneNumber,
      focusedBorderColor: AppColors.black01,
      textStyle: TextStyle(
        fontSize: AppDimensions.fontSize14,
        fontWeight: FontWeight.w400,
      ),
      padding: [
        AppDimensions.gap12w,
        AppDimensions.gap20h,
        AppDimensions.gap12w,
        AppDimensions.gap20h,
      ],
      cursorColor: AppColors.primary,
      inputFormatters: 'digits',
      hintStyle: TextStyle(
        fontSize: AppDimensions.fontSize12,
      ),
      borderColor: AppColors.gray02,
      borderWidth: 1.5,
      isError: ref.watch(AuthLoginErrorProvider) != null ? true : false,
    );
  }
}
