import 'package:bistro/app/core/extensions/context_extensions.dart';
import 'package:bistro/app/features/headers/domain/headers_apis.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/features/headers/presentation/widgets/views/headers_header01_view.dart';

class MainHeaderView extends HookConsumerWidget {
  const MainHeaderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    // Only re-run the Future if locale changes
    final future = useMemoized(
          () => HeadersApis().fetchSettings(
        lang: Locale(locale.languageCode).toString(),
      ),
      [locale.languageCode],
    );

    final snapshot = useFuture(future);

    String welcomeText;

    if (snapshot.connectionState == ConnectionState.waiting) {
      welcomeText = context.localizations.welcome;
    } else if (snapshot.hasError || snapshot.data == null) {
      welcomeText = context.localizations.welcome;
    } else {
      welcomeText = snapshot.data!.welcomeMessage;
    }

    return HeadersHeader01View(
      text: welcomeText,
      color: AppColors.primary,
    );
  }
}
