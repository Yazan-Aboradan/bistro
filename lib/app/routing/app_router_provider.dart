import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/storage/app_storage_provider.dart';
import '../global_pages/app_error_page.dart';
import 'app_router_routes.dart';

final goRouterProvider = Provider<GoRouter>(
      (ref) {
    final appStorage = ref.read(
      appStorageProvider,
    );

    return GoRouter(
      routes: AppRouterRoutes.routes,
      initialLocation: AppRouterEnum.splash.path,
      initialExtra: null,
      errorBuilder: (
          BuildContext context,
          GoRouterState state,
          ) {
        return const AppErrorPage(
          message: 'No route match',
        );
      },
      debugLogDiagnostics: true,
      redirect: (
          BuildContext context,
          GoRouterState state,
          ) {
        // if (state.fullPath == AppRouterEnum.login.path) {
        //   final isLoggedIn = appStorage.read<bool>(
        //     AppStorageKeys.isLoggedIn,
        //     false,
        //   );
        //
        //   if (isLoggedIn) {
        //     final username = appStorage.read<String?>(
        //       AppStorageKeys.username,
        //       null,
        //     );
        //
        //     return '/home/Settings?username=$username';
        //   }
        // }

        return null;
      },
      redirectLimit: 5,
    );
  },
);
