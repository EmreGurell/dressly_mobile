import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/presentation/widgets/feed_action_button.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class FeedActions extends StatelessWidget {
  final Product product;
  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onTryOn;

  const FeedActions({
    super.key,
    required this.product,
    required this.onLike,
    required this.onSave,
    required this.onTryOn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FeedActionButton(
          icon: PhosphorIcons.heart(PhosphorIconsStyle.fill),
          color: product.isLiked ? Colors.red : AppColors.white.withValues(alpha: .6),
          onTap: onLike,
          animation: ButtonAnimation.particles,
          particleColors: const [Colors.red, Colors.pink, Colors.redAccent],
        ),
        _CountLabel(count: product.likeCount),
        const SizedBox(height: AppSizes.space16),
        FeedActionButton(
          icon: PhosphorIcons.bookmarkSimple(PhosphorIconsStyle.fill),
          color: product.isSaved ? AppColors.yellow : AppColors.white.withValues(alpha: .6),
          onTap: onSave,
          animation: ButtonAnimation.particles,
          particleColors: const [AppColors.yellow, Colors.amber, Colors.orange],
        ),
        _CountLabel(count: product.saveCount),
        const SizedBox(height: AppSizes.space16),
        FeedActionButton(
          icon: PhosphorIcons.camera(),
          color: AppColors.white,
          onTap: onTryOn,
          animation: ButtonAnimation.bounce,
        ),
      ],
    );
  }
}

class _CountLabel extends StatelessWidget {
  final int count;
  const _CountLabel({required this.count});

  String _format(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _format(count),
      style: context.appTextTheme.labelSmall?.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        shadows: const [Shadow(color: Colors.black54, blurRadius: 4)],
      ),
    );
  }
}
