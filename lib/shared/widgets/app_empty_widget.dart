import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class AppEmptyWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final PhosphorIconData? icon;
  final VoidCallback? onAction;
  final String? actionLabel;

  const AppEmptyWidget({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              icon ?? PhosphorIcons.tray(),
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            if (title != null)
              Text(
                title!,
                style: context.appTextTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: context.appTextTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.6),
                    ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel ?? 'Action'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

