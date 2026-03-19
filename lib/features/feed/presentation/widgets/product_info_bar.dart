import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class ProductInfoBar extends StatelessWidget {
  final Product product;

  const ProductInfoBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.space12,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: AppSizes.borderMedium),
          ),
          child: ClipOval(
            child: product.brandLogoUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: product.brandLogoUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 40,
                    height: 40,
                    color: AppColors.grey300,
                  ),
          ),
        ),
        Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              product.brandName.toUpperCase(),
              style: context.appTextTheme.labelMedium?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.name,
              style: context.appTextTheme.labelSmall?.copyWith(
                color: AppColors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        ),
      ],
    );
  }
}
