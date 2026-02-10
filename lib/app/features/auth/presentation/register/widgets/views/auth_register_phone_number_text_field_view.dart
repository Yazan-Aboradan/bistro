import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_field_widget.dart';
import '../../hooks/register_phone_number_hook.dart';
import '../../providers/auth_register_controller_provider.dart';
import '../../providers/auth_register_error_provider.dart';

class AuthRegisterPhoneNumberTextFieldView extends HookConsumerWidget {
  const AuthRegisterPhoneNumberTextFieldView({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final  phoneNumber= ref.watch(authRegisterControllerProvider.select((state) => state.phoneNumber));

    final phoneNumberTextEditingController = useRegisterPhoneNumber(
      ref: ref,
      initialText: phoneNumber,
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
      keyboardType:TextInputType.phone,
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
      // Focus only if the screen is active
      isError: ref.watch(authRegisterErrorProvider('phoneNumber')) != null ? true : false,
    );
  }
}
