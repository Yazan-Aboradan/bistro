import 'package:bistro/app/features/auth/presentation/register/auth_register_language_page.dart';
import 'package:bistro/app/features/main/main_wifi_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bistro/app/features/auth/presentation/register/auth_register_birthday_page.dart';
import 'package:bistro/app/features/auth/presentation/register/auth_register_gender_page.dart';
import 'package:bistro/app/features/auth/presentation/register/auth_register_name_page.dart';
import 'package:bistro/app/features/auth/presentation/register/auth_register_phone_number_page.dart';
import 'package:bistro/app/features/auth/presentation/register/auth_register_privacy_and_policy_page.dart';
import 'package:bistro/app/features/main/main_page.dart';
import 'package:bistro/app/features/splash/presentation/splash_page.dart';
import 'package:bistro/app/features/auth/presentation/login/auth_login_page.dart';

import '../features/products/presentation/products_page.dart';

part 'app_router_keys.dart';

part 'app_router_enum.dart';

class AppRouterRoutes {
  static final routes = [
    // Splash
    GoRoute(
      name: AppRouterEnum.splash.name,
      path: AppRouterEnum.splash.path,
      builder: (context, state) {
        final target = state.uri.queryParameters['target'];
        return SplashPage(length: 2, target: target);
      },
    ),
    // Auth
    GoRoute(
      name: AppRouterEnum.language.name,
      path: AppRouterEnum.language.path,
      builder: (context, state) => const AuthRegisterLanguagePage(),
    ),
    GoRoute(
      name: AppRouterEnum.namee.name,
      path: AppRouterEnum.namee.path,
      builder: (context, state) => const AuthRegisterNamePage(),
    ),
    GoRoute(
      name: AppRouterEnum.birthDay.name,
      path: AppRouterEnum.birthDay.path,
      builder: (context, state) => const AuthRegisterBirthdayPage(),
    ),
    GoRoute(
      name: AppRouterEnum.gender.name,
      path: AppRouterEnum.gender.path,
      builder: (context, state) => const AuthRegisterGenderPage(),
    ),
    GoRoute(
      name: AppRouterEnum.phoneNumber.name,
      path: AppRouterEnum.phoneNumber.path,
      builder: (context, state) => const AuthRegisterPhoneNumberPage(),
    ),
    GoRoute(
      name: AppRouterEnum.privacyAndPolicy.name,
      path: AppRouterEnum.privacyAndPolicy.path,
      builder: (context, state) => const AuthRegisterPrivacyAndPolicyPage(),
    ),

    GoRoute(
      name: AppRouterEnum.login.name,
      path: AppRouterEnum.login.path,
      builder: (context, state) => const AuthLoginPage(),
    ),

    // Main
    GoRoute(
      name: AppRouterEnum.main.name,
      path: AppRouterEnum.main.path,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      name: AppRouterEnum.wifi.name,
      path: AppRouterEnum.wifi.path,
      builder: (context, state) => const MainWifiPage(),
    ),
    // User

    GoRoute(
      name: AppRouterEnum.categories.name,
      path: AppRouterEnum.categories.path,
      builder: (BuildContext context, GoRouterState state) {
        final categoryId = state.pathParameters[AppRouterKeys.id].toString();
        return ProductsPage(categoryId: categoryId);
      },
    ),
  ];
}
