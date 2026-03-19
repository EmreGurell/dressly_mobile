import 'package:flutter/material.dart';

class AppHelpers {
  AppHelpers._();

  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).unfocus();

  static Future<T?> showAppDialog<T>({
    required BuildContext context,
    required Widget dialog,
    bool barrierDismissible = true,
  }) =>
      showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) => dialog,
      );
}

