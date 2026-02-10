// Only splash is eagerly loaded — everything else is deferred
import 'package:bistro/app/features/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Deferred imports: these pages are downloaded on-demand, not at startup
import 'package:bistro/app/features/auth/presentation/register/auth_register_language_page.dart'
    deferred as lang_page;
import 'package:bistro/app/features/auth/presentation/register/auth_register_birthday_page.dart'
    deferred as birthday_page;
import 'package:bistro/app/features/auth/presentation/register/auth_register_gender_page.dart'
    deferred as gender_page;
import 'package:bistro/app/features/auth/presentation/register/auth_register_name_page.dart'
    deferred as name_page;
import 'package:bistro/app/features/auth/presentation/register/auth_register_phone_number_page.dart'
    deferred as phone_page;
import 'package:bistro/app/features/auth/presentation/register/auth_register_privacy_and_policy_page.dart'
    deferred as privacy_page;
import 'package:bistro/app/features/auth/presentation/login/auth_login_page.dart'
    deferred as login_page;
import 'package:bistro/app/features/main/main_page.dart' deferred as main_page;
import 'package:bistro/app/features/main/main_wifi_page.dart'
    deferred as wifi_page;
import 'package:bistro/app/features/products/presentation/products_page.dart'
    deferred as products_page;

part 'app_router_keys.dart';

part 'app_router_enum.dart';

class AppRouterRoutes {
  /// Helper that loads a deferred library, then builds the page widget.
  /// Shows a minimal loading indicator while the chunk downloads.
  static Widget _deferred(
    Future<void> Function() loader,
    Widget Function() builder,
  ) {
    return FutureBuilder(
      future: loader(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return builder();
        }
        // Tiny loading indicator while the deferred chunk downloads
        return const Scaffold(
          body: Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }

  static final routes = [
    // Splash — eagerly loaded (initial screen)
    GoRoute(
      name: AppRouterEnum.splash.name,
      path: AppRouterEnum.splash.path,
      builder: (context, state) {
        final target = state.uri.queryParameters['target'];
        return SplashPage(length: 2, target: target);
      },
    ),
    // Auth — all deferred
    GoRoute(
      name: AppRouterEnum.language.name,
      path: AppRouterEnum.language.path,
      builder: (context, state) => _deferred(
        lang_page.loadLibrary,
        () => lang_page.AuthRegisterLanguagePage(),
      ),
    ),
    GoRoute(
      name: AppRouterEnum.namee.name,
      path: AppRouterEnum.namee.path,
      builder: (context, state) => _deferred(
        name_page.loadLibrary,
        () => name_page.AuthRegisterNamePage(),
      ),
    ),
    GoRoute(
      name: AppRouterEnum.birthDay.name,
      path: AppRouterEnum.birthDay.path,
      builder: (context, state) => _deferred(
        birthday_page.loadLibrary,
        () => birthday_page.AuthRegisterBirthdayPage(),
      ),
    ),
    GoRoute(
      name: AppRouterEnum.gender.name,
      path: AppRouterEnum.gender.path,
      builder: (context, state) => _deferred(
        gender_page.loadLibrary,
        () => gender_page.AuthRegisterGenderPage(),
      ),
    ),
    GoRoute(
      name: AppRouterEnum.phoneNumber.name,
      path: AppRouterEnum.phoneNumber.path,
      builder: (context, state) => _deferred(
        phone_page.loadLibrary,
        () => phone_page.AuthRegisterPhoneNumberPage(),
      ),
    ),
    GoRoute(
      name: AppRouterEnum.privacyAndPolicy.name,
      path: AppRouterEnum.privacyAndPolicy.path,
      builder: (context, state) => _deferred(
        privacy_page.loadLibrary,
        () => privacy_page.AuthRegisterPrivacyAndPolicyPage(),
      ),
    ),

    GoRoute(
      name: AppRouterEnum.login.name,
      path: AppRouterEnum.login.path,
      builder: (context, state) => _deferred(
        login_page.loadLibrary,
        () => login_page.AuthLoginPage(),
      ),
    ),

    // Main — deferred
    GoRoute(
      name: AppRouterEnum.main.name,
      path: AppRouterEnum.main.path,
      builder: (context, state) => _deferred(
        main_page.loadLibrary,
        () => main_page.MainPage(),
      ),
    ),
    GoRoute(
      name: AppRouterEnum.wifi.name,
      path: AppRouterEnum.wifi.path,
      builder: (context, state) => _deferred(
        wifi_page.loadLibrary,
        () => wifi_page.MainWifiPage(),
      ),
    ),
    // Products — deferred
    GoRoute(
      name: AppRouterEnum.categories.name,
      path: AppRouterEnum.categories.path,
      builder: (BuildContext context, GoRouterState state) {
        final categoryId = state.pathParameters[AppRouterKeys.id].toString();
        return _deferred(
          products_page.loadLibrary,
          () => products_page.ProductsPage(categoryId: categoryId),
        );
      },
    ),
  ];
}
