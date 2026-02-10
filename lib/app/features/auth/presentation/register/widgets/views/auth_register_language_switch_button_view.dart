import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRegisterLanguageSwitchButtonView extends ConsumerWidget {
  final void Function(String gender)? onChanged;
  final String selectedLanguage;

  const AuthRegisterLanguageSwitchButtonView({
    super.key,
    this.onChanged,
    required this.selectedLanguage,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final bool isMale = selectedLanguage.toLowerCase() == 'en';
    final bool isFemale = selectedLanguage.toLowerCase() == 'ar';
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          _buildLanguageOption(
            label: 'English',
            isSelected: isMale,
            onTap: () async{
              onChanged?.call('en');
              ref.read(localeProvider.notifier).state = Locale('en');
              // ref.read(appLocalizationProvider).changeLocale(localeKey: 'en');
            },
          ),
          Gap(AppDimensions.gap20w),
          _buildLanguageOption(
            label: 'العربية',
            isSelected: isFemale,
            onTap: () async{
              onChanged?.call('ar');
              ref.read(localeProvider.notifier).state = Locale('ar');
              // ref.read(appLocalizationProvider).changeLocale(localeKey: 'ar');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    // required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(vertical: AppDimensions.gap15h, horizontal: AppDimensions.gap08h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary.withOpacity(0.15) : Colors.white,
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.gray02,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextWidget(
                text: label,
                fontSize: AppDimensions.fontSize20,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.primary: Colors.black ,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
