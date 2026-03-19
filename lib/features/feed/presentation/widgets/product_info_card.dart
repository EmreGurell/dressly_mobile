import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/shared/theme/theme.dart';

class ProductInfoCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductInfoCard({super.key, required this.product, this.onTap});

  Future<void> _openUrl() async {
    if (product.productUrl.isEmpty) return;
    final uri = Uri.tryParse(product.productUrl);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: product.productUrl.isNotEmpty ? _openUrl : onTap,
      child: Container(
        padding: AppPadding.p8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.circular12,
          border: Border.all(color: AppColors.white),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.space8,
            children: [
              ClipRRect(
                borderRadius: AppRadius.circular8,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: context.appTextTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.grey900,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.space4),
                    Text(
                      '${product.price.toStringAsFixed(2)} TL',
                      style: context.appTextTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: PhosphorIcon(
                  PhosphorIcons.caretRight(),
                  size: AppSizes.iconSmall,
                  color: AppColors.grey600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
