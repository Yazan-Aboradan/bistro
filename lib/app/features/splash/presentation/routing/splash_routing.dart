import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bistro/app/routing/app_router_routes.dart';

extension SplashRouting on BuildContext {

  void splashToLogin() {
    return goNamed(
      AppRouterEnum.login.name,
    );
  }
  void splashToMain() {
    return goNamed(
      AppRouterEnum.main.name,
    );
  }
}
