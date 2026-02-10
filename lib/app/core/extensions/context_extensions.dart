import 'package:bistro/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  ThemeData get themes => Theme.of(
        this,
      );

  AppLocalizations get localizations => AppLocalizations.of(
        this,
      );

}
extension ScreenWidth on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double fontSize({double factor = 0.05, double max = 40.0}) {
    return (screenWidth * factor).clamp(20, max);
  }
}
extension FontSizeLimiter on BuildContext {
  /// Clamp the font size between optional min and max limits.
  /// You only need to pass the fontSize; min and max are optional.
  double limitedFontSize(
      double fontSize, {
        double min = 12,
        double max = 40,
      }) {
    return fontSize.clamp(min, max);
  }
}
