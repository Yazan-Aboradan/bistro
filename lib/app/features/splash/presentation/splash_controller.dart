import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bistro/app/core/storage/app_storage.dart';
import 'package:bistro/app/core/storage/app_storage_provider.dart';
import 'package:bistro/app/features/splash/presentation/routing/splash_routing.dart';

class SplashController {
  final Ref ref;

  SplashController(this.ref);

  Future<void> handleSplashDelay(BuildContext context, int length) async {
    // Navigate on next frame — no artificial delay for web
    await Future.delayed(Duration.zero);

    final appStorage = ref.read(appStorageProvider);

    final isLoggedIn = appStorage.read<bool>(
      key: AppStorageKeys.isLoggedIn,
      defaultValue: false,
    );

    final username = appStorage.read<String?>(
      key: AppStorageKeys.username,
      defaultValue: null,
    );

    if (!isLoggedIn) {
      context.splashToLogin();
    } else {
      context.splashToMain();
    }
  }
}
