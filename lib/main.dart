import 'package:flutter/material.dart';

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bistro/app/core/storage/app_storage.dart';

import 'app.dart';

Future<void> main() async {
  setUrlStrategy(const HashUrlStrategy());
  await AppStorage.getInstance().init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
