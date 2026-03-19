import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color success;
  final Color warning;
  final Color info;
  final Color cardBackground;
  final Color divider;
  final Color shimmerBase;
  final Color shimmerHighlight;

  const AppThemeExtension({
    required this.success,
    required this.warning,
    required this.info,
    required this.cardBackground,
    required this.divider,
    required this.shimmerBase,
    required this.shimmerHighlight,
  });

  static const light = AppThemeExtension(
    success: Color(0xFF4CAF50),
    warning: Color(0xFFFF9800),
    info: Color(0xFF2196F3),
    cardBackground: Color(0xFFFFFFFF),
    divider: Color(0xFFE0E0E0),
    shimmerBase: Color(0xFFE0E0E0),
    shimmerHighlight: Color(0xFFF5F5F5),
  );

  static const dark = AppThemeExtension(
    success: Color(0xFF66BB6A),
    warning: Color(0xFFFFB74D),
    info: Color(0xFF42A5F5),
    cardBackground: Color(0xFF1E1E1E),
    divider: Color(0xFF424242),
    shimmerBase: Color(0xFF424242),
    shimmerHighlight: Color(0xFF616161),
  );

  @override
  AppThemeExtension copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? cardBackground,
    Color? divider,
    Color? shimmerBase,
    Color? shimmerHighlight,
  }) =>
      AppThemeExtension(
        success: success ?? this.success,
        warning: warning ?? this.warning,
        info: info ?? this.info,
        cardBackground: cardBackground ?? this.cardBackground,
        divider: divider ?? this.divider,
        shimmerBase: shimmerBase ?? this.shimmerBase,
        shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
      );

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      shimmerBase: Color.lerp(shimmerBase, other.shimmerBase, t)!,
      shimmerHighlight: Color.lerp(shimmerHighlight, other.shimmerHighlight, t)!,
    );
  }
}

