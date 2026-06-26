import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/product_detail/presentation/bloc/product_detail_bloc.dart';
import 'package:ai_try_on/features/product_detail/presentation/bloc/product_detail_event.dart';
import 'package:ai_try_on/features/product_detail/presentation/bloc/product_detail_state.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;
  final Product? cached;

  const ProductDetailPage({super.key, required this.productId, this.cached});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductDetailBloc>()
        ..add(ProductDetailEvent.load(productId)),
      child: _ProductDetailView(cached: cached),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  final Product? cached;
  const _ProductDetailView({this.cached});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) => state.when(
        initial: () => _scaffold(context, cached, loading: true),
        loading: () => _scaffold(context, cached, loading: true),
        error: (msg) => Scaffold(
          appBar: AppBar(),
          body: AppErrorWidget(
            message: msg,
            onRetry: () => context
                .read<ProductDetailBloc>()
                .add(ProductDetailEvent.load(
                    cached?.id ?? 0)),
          ),
        ),
        loaded: (product, isLikeLoading, isSaveLoading) =>
            _scaffold(context, product,
                isLikeLoading: isLikeLoading,
                isSaveLoading: isSaveLoading),
      ),
    );
  }

  Widget _scaffold(
    BuildContext context,
    Product? product, {
    bool loading = false,
    bool isLikeLoading = false,
    bool isSaveLoading = false,
  }) {
    if (loading && product == null) {
      return Scaffold(appBar: AppBar(), body: const AppLoadingWidget());
    }
    final p = product!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _ProductSliverAppBar(product: p),
          SliverToBoxAdapter(
            child: _ProductInfo(product: p),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: _BottomBar(
        product: p,
        isLikeLoading: isLikeLoading,
        isSaveLoading: isSaveLoading,
      ),
    );
  }
}

// ─── Sliver App Bar ──────────────────────────────────────────────────────────

class _ProductSliverAppBar extends StatelessWidget {
  final Product product;
  const _ProductSliverAppBar({required this.product});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SliverAppBar(
      expandedHeight: 440,
      pinned: true,
      stretch: true,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: cs.surface.withValues(alpha: 0.85),
          child: IconButton(
            icon: PhosphorIcon(PhosphorIcons.arrowLeft(), size: 20),
            color: cs.onSurface,
            onPressed: () => context.pop(),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) =>
                  ColoredBox(color: cs.surfaceContainerHighest),
              errorWidget: (_, __, ___) =>
                  ColoredBox(color: cs.surfaceContainerHighest),
            ),
            // Bottom gradient for readability
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.6, 1.0],
                  colors: [Colors.transparent, cs.surface],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Product Info ─────────────────────────────────────────────────────────────

class _ProductInfo extends StatelessWidget {
  final Product product;
  const _ProductInfo({required this.product});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: AppPadding.p20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand
          Row(
            children: [
              if (product.brandLogoUrl.isNotEmpty) ...[
                CachedNetworkImage(
                  imageUrl: product.brandLogoUrl,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                  errorWidget: (_, __, ___) => const SizedBox.shrink(),
                ),
                const SizedBox(width: AppSizes.space8),
              ],
              Text(
                product.brandName.toUpperCase(),
                style: context.appTextTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: cs.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              _CategoryChip(category: product.category),
            ],
          ),
          const SizedBox(height: AppSizes.space8),
          // Product Name
          Text(
            product.name,
            style: context.appTextTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSizes.space8),
          // Price
          Text(
            '${product.price.toStringAsFixed(2)} TL',
            style: context.appTextTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: AppSizes.space20),
          Divider(color: cs.outlineVariant.withValues(alpha: 0.4)),
          const SizedBox(height: AppSizes.space12),
          // Stats
          Row(
            children: [
              PhosphorIcon(PhosphorIcons.heart(PhosphorIconsStyle.fill),
                  size: 16, color: cs.onSurfaceVariant),
              const SizedBox(width: AppSizes.space4),
              Text(
                '${product.likeCount}',
                style: context.appTextTheme.bodySmall
                    ?.copyWith(color: cs.onSurfaceVariant),
              ),
              const SizedBox(width: AppSizes.space16),
              PhosphorIcon(PhosphorIcons.bookmarkSimple(PhosphorIconsStyle.fill),
                  size: 16, color: cs.onSurfaceVariant),
              const SizedBox(width: AppSizes.space4),
              Text(
                '${product.saveCount}',
                style: context.appTextTheme.bodySmall
                    ?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Category Chip ───────────────────────────────────────────────────────────

class _CategoryChip extends StatelessWidget {
  final String category;
  const _CategoryChip({required this.category});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.space12, vertical: AppSizes.space4),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: AppRadius.circular100,
      ),
      child: Text(
        category,
        style: context.appTextTheme.labelSmall?.copyWith(
          color: cs.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ─── Bottom Bar ───────────────────────────────────────────────────────────────

class _BottomBar extends StatelessWidget {
  final Product product;
  final bool isLikeLoading;
  final bool isSaveLoading;

  const _BottomBar({
    required this.product,
    required this.isLikeLoading,
    required this.isSaveLoading,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bloc = context.read<ProductDetailBloc>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
          color: cs.surface,
          border: Border(top: BorderSide(color: cs.outlineVariant.withValues(alpha: 0.3))),
        ),
        child: Row(
          children: [
            // Like
            _ActionIconButton(
              icon: product.isLiked
                  ? PhosphorIcons.heart(PhosphorIconsStyle.fill)
                  : PhosphorIcons.heart(),
              color: product.isLiked ? Colors.red : cs.onSurfaceVariant,
              count: product.likeCount,
              loading: isLikeLoading,
              onTap: () => bloc.add(const ProductDetailEvent.toggleLike()),
            ),
            const SizedBox(width: AppSizes.space16),
            // Save
            _ActionIconButton(
              icon: product.isSaved
                  ? PhosphorIcons.bookmarkSimple(PhosphorIconsStyle.fill)
                  : PhosphorIcons.bookmarkSimple(),
              color: product.isSaved ? cs.primary : cs.onSurfaceVariant,
              count: product.saveCount,
              loading: isSaveLoading,
              onTap: () => bloc.add(const ProductDetailEvent.toggleSave()),
            ),
            const Spacer(),
            // Buy
            if (product.productUrl.isNotEmpty)
              IconButton(
                onPressed: () => _launchUrl(product.productUrl),
                icon: PhosphorIcon(PhosphorIcons.shoppingBag(),
                    size: AppSizes.iconMedium, color: cs.onSurfaceVariant),
              ),
            const SizedBox(width: AppSizes.space8),
            // Try On
            FilledButton.icon(
              onPressed: () =>
                  context.push(AppRoutes.tryon, extra: product),
              icon: PhosphorIcon(PhosphorIcons.tShirt(), size: 18),
              label: const Text('Dene'),
              style: FilledButton.styleFrom(
                backgroundColor: cs.onSurface,
                foregroundColor: cs.surface,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.space20, vertical: AppSizes.space12),
                shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.circular12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _ActionIconButton extends StatelessWidget {
  final PhosphorIconData icon;
  final Color color;
  final int count;
  final bool loading;
  final VoidCallback onTap;

  const _ActionIconButton({
    required this.icon,
    required this.color,
    required this.count,
    required this.loading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Row(
        children: [
          loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: cs.onSurfaceVariant),
                )
              : PhosphorIcon(icon, size: 22, color: color),
          const SizedBox(width: AppSizes.space4),
          Text(
            '$count',
            style: context.appTextTheme.bodySmall?.copyWith(
              color: cs.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
