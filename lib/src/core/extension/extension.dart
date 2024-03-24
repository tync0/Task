import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension MainExtension on BuildContext {
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
  double dynamicHeight(double value) => mediaQueryHeight * value;
  double dynamicWidth(double value) => mediaQueryWidth * value;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
