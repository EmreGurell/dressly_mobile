import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/app_theme_extension.dart';

extension AppTextThemeExtension on BuildContext {
  TextTheme get appTextTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppThemeExtension get themeExt =>
      Theme.of(this).extension<AppThemeExtension>()!;
}
