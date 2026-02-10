import 'package:bistro/app/features/auth/presentation/register/routing/auth_register_routing.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/features/auth/presentation/register/auth_register_page.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../l10n/providers/locale_provider.dart';
import '../../../../core/storage/app_storage.dart';
import '../login/providers/login_error_provider.dart';
import 'providers/auth_register_controller_provider.dart';
import 'widgets/views/auth_register_button_view.dart';
import 'widgets/views/auth_register_language_switch_button_view.dart';

class AuthRegisterLanguagePage extends ConsumerWidget {
  const AuthRegisterLanguagePage({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    // ref.read(AuthLoginErrorProvider.notifier).state = null;

    final language = ref.watch(localeProvider).languageCode;

    final controller = ref.read(authRegisterControllerProvider.notifier);

    return AuthRegisterPage(
      widget: [
        AppTextWidget(
          text: context.localizations.whatIsYourLanguage,
          fontSize: AppDimensions.fontSize24,
          color: AppColors.black01,
          maxLines: 5,
          fontWeight: FontWeight.w600,
        ),
        Gap(AppDimensions.gap10h),
        AppTextWidget(
          text: context.localizations.chooseYourLanguageByClickingOn,
          fontSize: AppDimensions.fontSize14,
          color: AppColors.black01,
          maxLines: 5,
        ),
        Gap(AppDimensions.gap20h),
        AuthRegisterLanguageSwitchButtonView(
          selectedLanguage: language,
          onChanged: (value) async{
            controller.updateLanguage(value: value);
          },
        ),
        Gap(AppDimensions.gap30h),
        AuthRegisterButtonView(
          onPressed: () {
            context.registerToName();
          },
        ),
      ],
    );
  }
}
