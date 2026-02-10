import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_field_widget.dart';

import '../../hooks/register_last_name_hook.dart';
import '../../providers/auth_register_controller_provider.dart';
import '../../providers/auth_register_error_provider.dart';

class AuthRegisterLastNameTextFieldView extends HookConsumerWidget {
  const AuthRegisterLastNameTextFieldView({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final  lastName= ref.watch(authRegisterControllerProvider.select((state) => state.lastName));

    final lastNameTextEditingController = useRegisterLastName(
      ref: ref,
      initialText: lastName,
    );

    return AppTextFieldWidget(
      textEditingController: lastNameTextEditingController,
      hintText: context.localizations.lastName,
      backgroundColor: AppColors.secondary,
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
      inputFormatters: 'lettersAndSpaces',
      hintStyle: TextStyle(
        fontSize: AppDimensions.fontSize12,
      ),
      borderColor: AppColors.gray02,
      borderWidth: 1.5,
      isError: ref.watch(authRegisterErrorProvider('lastName'))!=null ?true:false,
    );
  }
}
