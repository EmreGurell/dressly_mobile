import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/features/auth/domain/entities/user.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return Container(
      width: double.infinity,
      padding: AppPadding.p24,
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
       
      ),
      child: Column(
        children: [
          _Avatar(avatarUrl: user.avatar),
          const SizedBox(height: AppSizes.space12),
          Text(
            user.name ?? 'Kullanıcı',
            style: context.appTextTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: AppSizes.space4),
          Text(
            user.email,
            style: context.appTextTheme.bodySmall?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? avatarUrl;

  const _Avatar({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: cs.outlineVariant, width: AppSizes.borderThick),
      ),
      child: ClipOval(
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: avatarUrl!,
                fit: BoxFit.cover,
                placeholder: (_, __) => ColoredBox(color: cs.surfaceContainerLow),
                errorWidget: (_, __, ___) => const _AvatarPlaceholder(),
              )
            : const _AvatarPlaceholder(),
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder();

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return ColoredBox(
      color: cs.surfaceContainerLow,
      child: Center(
        child: PhosphorIcon(
          PhosphorIcons.user(PhosphorIconsStyle.fill),
          size: AppSizes.iconXLarge,
          color: cs.onSurfaceVariant,
        ),
      ),
    );
  }
}
