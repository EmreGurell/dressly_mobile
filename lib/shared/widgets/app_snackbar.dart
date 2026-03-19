import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum SnackbarType { success, error, warning, info }

class AppSnackbar {
  AppSnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final color = switch (type) {
      SnackbarType.success => const Color(0xFF4CAF50),
      SnackbarType.error => Theme.of(context).colorScheme.error,
      SnackbarType.warning => const Color(0xFFFF9800),
      SnackbarType.info => Theme.of(context).colorScheme.primary,
    };

    final icon = switch (type) {
      SnackbarType.success => PhosphorIcons.checkCircle(),
      SnackbarType.error => PhosphorIcons.xCircle(),
      SnackbarType.warning => PhosphorIcons.warning(),
      SnackbarType.info => PhosphorIcons.info(),
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              PhosphorIcon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: color,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
  }

  static void success(BuildContext context, String message) =>
      show(context, message: message, type: SnackbarType.success);

  static void error(BuildContext context, String message) =>
      show(context, message: message, type: SnackbarType.error);

  static void warning(BuildContext context, String message) =>
      show(context, message: message, type: SnackbarType.warning);
}

