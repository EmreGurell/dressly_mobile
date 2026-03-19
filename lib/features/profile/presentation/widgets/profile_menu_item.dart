import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final PhosphorIconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final effectiveIconColor = iconColor ?? cs.primary;
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: effectiveIconColor.withValues(alpha: 0.1),
          borderRadius: AppRadius.circular8,
        ),
        child: PhosphorIcon(
          icon,
          size: AppSizes.iconMedium,
          color: effectiveIconColor,
        ),
      ),
      title: Text(
        title,
        style: context.appTextTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: cs.onSurface,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: context.appTextTheme.labelSmall?.copyWith(
                color: cs.onSurfaceVariant,
              ),
            )
          : null,
      trailing: trailing ??
          PhosphorIcon(
            PhosphorIcons.caretRight(),
            size: AppSizes.iconSmall,
            color: cs.onSurfaceVariant,
          ),
      contentPadding: AppPadding.horizontal16,
    );
  }
}
