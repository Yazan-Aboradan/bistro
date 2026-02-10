import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_field_widget.dart';

import '../../hooks/register_first_name_hook.dart';
import '../../providers/auth_register_controller_provider.dart';
import '../../providers/auth_register_error_provider.dart';

class AuthRegisterFirstNameTextFieldView extends HookConsumerWidget {
  const AuthRegisterFirstNameTextFieldView({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final firstName = ref.watch(authRegisterControllerProvider.select((state) => state.firstName));

    final firstNameTextEditingController = useRegisterFirstName(
      ref: ref,
      initialText: firstName
    );
    return AppTextFieldWidget(
      textEditingController: firstNameTextEditingController,
      backgroundColor: AppColors.secondary,
      hintText: context.localizations.firstName,
      focusedBorderColor: AppColors.black01,
      textStyle: TextStyle(
        fontSize: AppDimensions.fontSize14,
        fontWeight: FontWeight.w400,
      ),
      autofocus: true,
      padding: [
        AppDimensions.gap12w,
        AppDimensions.gap20h,
        AppDimensions.gap12w,
        AppDimensions.gap20h,
      ],
      cursorColor: AppColors.primary,
      inputFormatters: 'lettersAndSpaces',
      hintStyle: TextStyle(
        fontSize: AppDimensions.fontSize12,
      ),
      borderColor: AppColors.gray02,
      borderWidth: 1.5,
      isError: ref.watch(authRegisterErrorProvider('firstName'))!=null ?true:false,
    );
  }
}
