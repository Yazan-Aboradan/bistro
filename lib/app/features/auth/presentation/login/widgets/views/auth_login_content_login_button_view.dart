import 'package:bistro/app/core/storage/app_storage.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/features/auth/domain/auth_apis.dart';
import 'package:bistro/l10n/providers/app_localization_provider.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bistro/app/features/auth/presentation/login/routing/login_routing.dart';
import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/global_widgets/app_button_widget.dart';
import '../../providers/login_controller_provider.dart';
import '../../providers/user_controller_provider.dart';

class AuthLoginContentLoginButtonView extends HookConsumerWidget {
  const AuthLoginContentLoginButtonView({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final state = ref.watch(authLoginControllerProvider);

    final isLoading = ref.watch(
      authLoginControllerProvider.select(
        (value) => value.isLoading,
      ),
    );

    if (isLoading) {
      return CircularProgressIndicator(
        color: AppColors.primary,
      );
    }

    return AppButtonWidget(
        width: double.infinity,
        height: AppDimensions.height45,
        backgroundColor: AppColors.primary,
        textColor: AppColors.secondary,
        text: context.localizations.next.toUpperCase(),
        onPressed: () async {
          ref.read(authLoginControllerProvider.notifier).updateIsLoading(value: true);

          try {
            LoginResponse? loginResponse = await AuthApis().loginUser(state.phoneNumber, ref, context);
            if (loginResponse != null) {
              final user = loginResponse.user;
              final storage = AppStorage.getInstance();
              await storage.write(key: AppStorageKeys.phoneNumber, value: user.phoneNumber);
              await storage.write(key: AppStorageKeys.firstName, value: user.firstName);
              await storage.write(key: AppStorageKeys.lastName, value: user.lastName);
              await storage.write(key: AppStorageKeys.gender, value: user.gender);
              await storage.write(key: AppStorageKeys.countryCode, value: user.countryCode);
              await storage.write(key: AppStorageKeys.language, value: user.language);
              await storage.write(
                key: AppStorageKeys.birthday,
                value: user.birthday.toIso8601String(),
              );
              ref.read(localeProvider.notifier).state = Locale(user.language);
              await ref.read(appLocalizationProvider).changeLocale(localeKey: user.language);
              ref.read(userControllerProvider.notifier).updateLanguage(value: user.language);
              await storage.write(key: AppStorageKeys.token, value: loginResponse.token);
              // ShowDialogMessage(
              //   context: context,
              //   widget: FeaturedProductsWidget(
              //     product: FeaturedProduct(
              //       description: 'asdasdasdasdsaadasdsad',
              //       title: 'asdasd',
              //       imagePath: 'assets/images/products_pizza.jpg',
              //       isActive: true,
              //       featuredExpireDate: DateTime(2025,7,7),
              //       productId: '1',
              //       id: '1',
              //       featuredDate: '',
              //     ),
              //   ),
              // );
              context.loginToWifi();


            } else {}
          } catch (e, st) {
            debugPrint("Login error: $e\n$st");
          } finally {
            ref.read(authLoginControllerProvider.notifier).updateIsLoading(value: false);
          }
        });
  }
}

