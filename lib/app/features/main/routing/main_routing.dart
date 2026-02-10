import 'package:bistro/app/routing/app_router_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension MainRouting on BuildContext {
  Future<void> mainToContacts() async {
    pushNamed(
      AppRouterEnum.contacts.name,
    );
  }

  Future<void> mainToSettings() async {
    pushNamed(
      AppRouterEnum.settings.name,
    );
  }

  Future<void> mainToGames() async {
    pushNamed(
      AppRouterEnum.games.name,
    );
  }

  Future<void> mainToUser() async {
    pushNamed(
      AppRouterEnum.user.name,
    );
  }

  Future<void> mainToLogin() async {
    goNamed(
      AppRouterEnum.login.name,
    );
  }
  Future<void> mainToSplash() async {
    goNamed(
      AppRouterEnum.splash.name,
    );
  }
  Future<void> mainToCategory(String id) async {
    goNamed(
      AppRouterEnum.categories.name,
      pathParameters: {
        AppRouterKeys.id: id,
      },
    );

  }
  Future<void> toMain() async {
    goNamed(
      AppRouterEnum.main.name,
    );

  }
}
