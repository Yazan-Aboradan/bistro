import 'package:bistro/app/features/auth/presentation/register/widgets/views/auth_register_error_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'providers/auth_register_controller_provider.dart';
import 'providers/auth_register_error_provider.dart';
import 'auth_register_page.dart';
import 'widgets/views/app_birthday_widget.dart';
import 'widgets/views/auth_register_button_view.dart';

class AuthRegisterBirthdayPage extends ConsumerWidget {
  const AuthRegisterBirthdayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(authRegisterControllerProvider.notifier);
    final birthdayError = ref.watch(authRegisterErrorProvider('birthday'));
    final birthday = ref.watch(authRegisterControllerProvider.select((state) => state.birthday));

    return AuthRegisterPage(
      widget: [
        AppTextWidget(
          text: context.localizations.whatIsYourBirthday,
          fontSize: AppDimensions.fontSize24,
          color: AppColors.black01,
          maxLines: 3,
          fontWeight: FontWeight.w600,
        ),
        Gap(AppDimensions.gap10h),
        AppTextWidget(
          text: context.localizations.chooseYourDateOfBirthYouCanScrollDownAndUpToAdjustThat,
          fontSize: AppDimensions.fontSize14,
          color: AppColors.black01,
          maxLines: 6,
        ),
        Gap(AppDimensions.gap20h),
        // AppBirthdayWidget(
        //   initialDate: birthday != DateTime(2000) ?birthday :DateTime(2000, 1, 1),
        //   onDateChanged: (date) {
        //     controller.updateBirthday(value: date);
        //     print('Birthday before editing: ${date}date');
        //     print('Birthday before editing: ${birthday}birthday');
        //
        //   },
        // ),
        BirthdatePicker(
          initialDate: DateTime(2006, 8, 29),
          onDateChanged: (date) {
            controller.updateBirthday(value: date);
          },
        ),
        if (birthdayError != null) ...[
          Gap(AppDimensions.gap20h),
          RegisterErrorLayoutView(
            text: birthdayError,
          ),
        ],
        Gap(AppDimensions.gap30h),
        AuthRegisterButtonView(
          onPressed: () {
            controller.validationBirthdayPage(context);
          },
        ),
      ],
    );
  }
}
