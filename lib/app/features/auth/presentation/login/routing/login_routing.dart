import 'package:bistro/app/routing/app_router_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension LoginRouting on BuildContext {
  Future<void> loginToWifi() async {
    goNamed(
      AppRouterEnum.wifi.name,
    );
  }

  Future<void> loginToRegister() async {
    pushNamed(
      AppRouterEnum.language.name,
    );
  }
  }

