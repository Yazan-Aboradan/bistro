import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/routing/app_router_provider.dart';
import 'l10n/app_localizations.dart';
import 'l10n/providers/locale_provider.dart';

class App extends ConsumerWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context,
      WidgetRef ref,) {
    final locale = ref.watch(
      localeProvider,
    );
    final goRouter = ref.read(
      goRouterProvider,
    );
    return MaterialApp.router(
      scrollBehavior: NoGlowScrollBehavior(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling, // Avoids font zoom issues
          ),
          // data: MediaQuery.of(context).copyWith(
          //   // it is no optimal
          //   devicePixelRatio: 1.0,
          //   textScaleFactor: 1.0,
          // ),
          child: SafeArea(
            child: child!,
          ),
        );
      },
      locale: locale,
      theme: ThemeData(
          fontFamily: locale.languageCode == 'ar' ? 'Cairo' : 'Montserrat',
          fontFamilyFallback: const ['Cairo', 'Montserrat',]
      ),
      debugShowCheckedModeBanner: false,
      //Routing
      routerConfig: goRouter,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class NoGlowScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}
