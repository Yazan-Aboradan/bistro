import 'package:bistro/app/core/values/app_dimensions.dart';
import 'package:bistro/app/global_widgets/app_icon_widget.dart';
import 'package:bistro/app/global_widgets/app_text_widget.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:country_picker/country_picker.dart';


final allCountries = CountryService().getAll();
final excludedCodes = ['IL', 'CN'];
final countries = allCountries.where((country) => !excludedCodes.contains(country.countryCode)).toList();


class AppCountryCodeDownListWidget extends ConsumerWidget {
  final String selectedCode;

  const AppCountryCodeDownListWidget({
    super.key,
    required this.selectedCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.zero, // No top/bottom radius
        ),
        child: ListView(
          children: countries.map((country) {
            final isSelected = country.countryCode == selectedCode;
            return ListTile(
              leading: country.countryCode == 'SY'
            ? Image.asset(
              'assets/images/syria.jpg',
              width: 25,
              height: 15,
              fit: BoxFit.cover,
            )
                : Flag.fromString(
            country.countryCode,
            width: 25,
            height: 15,
            fit: BoxFit.cover,
            ),

            title: AppTextWidget(
                text: '${country.name} (+${country.phoneCode})',
              ),
              trailing: isSelected
                  ? AppIconWidget(
                iconData: Icons.check,
                color: Colors.green,
                size: AppDimensions.iconSize24,
              )
                  : null,
              onTap: () => Navigator.pop(context, country.countryCode),
            );
          }).toList(),
        ),
      ),
    );
  }
}

