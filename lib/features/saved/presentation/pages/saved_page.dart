import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_event.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_state.dart';
import 'package:ai_try_on/shared/theme/app_colors.dart';
import 'package:ai_try_on/shared/theme/app_padding.dart';
import 'package:ai_try_on/shared/theme/app_radius.dart';
import 'package:ai_try_on/shared/theme/app_sizes.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SavedBloc>()..add(const SavedEvent.fetchSaved()),
      child: const _SavedView(),
    );
  }
}

class _SavedView extends StatelessWidget {
  const _SavedView();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saved'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Wishlist'),
              Tab(text: 'Outfit Ideas'),
            ],
          ),
        ),
        body: BlocBuilder<SavedBloc, SavedState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const AppLoadingWidget(),
            error: (msg) => AppErrorWidget(
              message: msg,
              onRetry: () =>
                  context.read<SavedBloc>().add(const SavedEvent.fetchSaved()),
            ),
            loaded: (products) => TabBarView(
              children: [
                _WishlistTab(products: products),
                _OutfitIdeasTab(products: products),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WishlistTab extends StatelessWidget {
  final List<Product> products;
  const _WishlistTab({required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const AppEmptyWidget();

    return GridView.builder(
      padding: AppPadding.p16,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.space12,
        mainAxisSpacing: AppSizes.space12,
        childAspectRatio: 0.72,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          _SavedProductCard(product: products[index]),
    );
  }
}

class _OutfitIdeasTab extends StatelessWidget {
  final List<Product> products;
  const _OutfitIdeasTab({required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const AppEmptyWidget();

    return ListView.separated(
      padding: AppPadding.p16,
      itemCount: products.length,
      separatorBuilder: (_, __) =>
          const SizedBox(height: AppSizes.space12),
      itemBuilder: (context, index) =>
          _SavedProductListTile(product: products[index]),
    );
  }
}

// Task 41 — Swipe to delete
class _SavedProductCard extends StatelessWidget {
  final Product product;
  const _SavedProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.up,
      background: Container(
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: AppRadius.circular12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhosphorIcon(PhosphorIcons.trash(), color: AppColors.white),
            const SizedBox(height: AppSizes.space4),
            const Text('Kaldır', style: TextStyle(color: AppColors.white, fontSize: 12)),
          ],
        ),
      ),
      onDismissed: (_) => context
          .read<SavedBloc>()
          .add(SavedEvent.removeProduct(product.id)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.circular12,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: AppRadius.top12,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (_, __) => Container(color: AppColors.grey100),
                  errorWidget: (_, __, ___) => Container(
                    color: AppColors.grey100,
                    child: PhosphorIcon(PhosphorIcons.imageBroken(),
                        color: AppColors.grey400),
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
                    product.name,
                    style: context.appTextTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.space4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: context.appTextTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SavedProductListTile extends StatelessWidget {
  final Product product;
  const _SavedProductListTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('outfit_${product.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: AppPadding.horizontal16,
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: AppRadius.circular12,
        ),
        child: PhosphorIcon(PhosphorIcons.trash(), color: AppColors.white),
      ),
      onDismissed: (_) => context
          .read<SavedBloc>()
          .add(SavedEvent.removeProduct(product.id)),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.circular12,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(color: AppColors.grey100),
                errorWidget: (_, __, ___) =>
                    Container(color: AppColors.grey100),
              ),
            ),
            Expanded(
              child: Padding(
                padding: AppPadding.p12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.brandName,
                      style: context.appTextTheme.bodySmall?.copyWith(
                            color: AppColors.grey500,
                          ),
                    ),
                    const SizedBox(height: AppSizes.space4),
                    Text(
                      product.name,
                      style: context.appTextTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.space4),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: context.appTextTheme.bodySmall?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
