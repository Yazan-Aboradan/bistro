import 'package:bistro/app/core/storage/app_storage.dart';
import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/features/main/main_page.dart';
import 'package:bistro/app/features/main/routing/main_routing.dart';
import 'package:bistro/l10n/providers/app_localization_provider.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';

import 'package:bistro/app/global_widgets/app_row_widget.dart';
import '../../../../../core/storage/app_storage.dart';
import 'headers_title_view.dart';

class HeadersHeader01View extends ConsumerWidget {
  final String text;
  final Color? color;

  const HeadersHeader01View({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final storage = AppStorage.getInstance();

    final locale = storage.read(key: 'language', defaultValue: '');
    final isEnglish = locale == 'en';

    return AppRowWidget(
      padding: [
        AppDimensions.gap12w,
        AppDimensions.gap20h,
        AppDimensions.gap12w,
        AppDimensions.gap20h,
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: HeadersTitleView(
            text: text,
            color: color,
          ),
        ),
        ToggleButtons(
          isSelected: [!isEnglish, isEnglish],
          onPressed: (index) async {
            final selectedLocale = index == 1 ? 'en' : 'ar';
            if (locale != selectedLocale) {
              ref.read(localeProvider.notifier).state = Locale(selectedLocale);
              await ref.read(appLocalizationProvider).changeLocale(localeKey: selectedLocale);
              await storage.write(key: AppStorageKeys.language, value: selectedLocale);
              ref.read(featuredDialogShownProvider.notifier).state = false;

              context.mainToSplash();
            }
          },
          borderRadius: BorderRadius.circular(0),
          selectedColor: Colors.white,
          fillColor: AppColors.primary,
          color: Colors.grey[700],
          constraints: const BoxConstraints(minHeight: 36, minWidth: 60),
          children: const [
            Text('AR', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('EN', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
