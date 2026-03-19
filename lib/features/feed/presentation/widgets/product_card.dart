import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/presentation/widgets/product_info_bar.dart';
import 'package:ai_try_on/features/feed/presentation/widgets/product_info_card.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onInfoTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: product.imageUrl,
          fit: BoxFit.cover,
          placeholder: (_, __) => const ColoredBox(color: AppColors.grey200),
          errorWidget: (_, __, ___) => const ColoredBox(color: AppColors.grey300),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withValues(alpha: 0.4),
                AppColors.transparent,
                AppColors.black.withValues(alpha: 0.87),
              ],
              stops: const [0.0, 0.4, 1.0],
            ),
          ),
        ),
        Positioned(
          top: AppSizes.space48,
          left: AppSizes.space16,
          right: AppSizes.space16,
          child: ProductInfoBar(product: product),
        ),
        Positioned(
          left: AppSizes.space16,
          right: 72,
          bottom: AppSizes.space16,
          child: ProductInfoCard(product: product, onTap: onInfoTap),
        ),
      ],
    );
  }
}
