import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

class CatalogProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const CatalogProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap ??
          () => context.push(
                AppRoutes.productDetail(product.id.toString()),
                extra: product,
              ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: AppRadius.circular8,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (_, __) =>
                    Container(color: cs.surfaceContainerHighest),
                errorWidget: (_, __, ___) => Container(
                  color: cs.surfaceContainerHighest,
                  child: Center(
                    child: PhosphorIcon(
                      PhosphorIcons.imageBroken(),
                      color: cs.outlineVariant,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: AppPadding.p8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brandName.toUpperCase(),
                  style: context.appTextTheme.bodySmall?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.name.toUpperCase(),
                  style: context.appTextTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSizes.space4),
                Text(
                  '${product.price.toStringAsFixed(2)}TL',
                  style: context.appTextTheme.bodySmall?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
