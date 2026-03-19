import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/app_theme_extension.dart';

extension BuildContextX on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get appTextTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>()!;

  // Screen
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // Navigation
  void pop<T>([T? result]) => Navigator.of(this).pop(result);
}

