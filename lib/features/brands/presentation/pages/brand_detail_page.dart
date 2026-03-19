import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_bloc.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_event.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_state.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/shared/theme/app_colors.dart';
import 'package:ai_try_on/shared/theme/app_padding.dart';
import 'package:ai_try_on/shared/theme/app_radius.dart';
import 'package:ai_try_on/shared/theme/app_sizes.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

class BrandDetailPage extends StatelessWidget {
  final Brand brand;
  const BrandDetailPage({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BrandDetailBloc>()
        ..add(BrandDetailEvent.load(brand)),
      child: _BrandDetailView(brand: brand),
    );
  }
}

class _BrandDetailView extends StatefulWidget {
  final Brand brand;
  const _BrandDetailView({required this.brand});

  @override
  State<_BrandDetailView> createState() => _BrandDetailViewState();
}

class _BrandDetailViewState extends State<_BrandDetailView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<BrandDetailBloc>().add(const BrandDetailEvent.loadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BrandDetailBloc, BrandDetailState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const AppLoadingWidget(),
          error: (msg) => AppErrorWidget(
            message: msg,
            onRetry: () => context
                .read<BrandDetailBloc>()
                .add(BrandDetailEvent.load(widget.brand)),
          ),
          loaded: (brand, products, categories, selectedCategory, _, hasMore, isLoadingMore) =>
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  _BrandAppBar(brand: brand),
                  if (categories.isNotEmpty)
                    SliverToBoxAdapter(
                      child: _CategoryFilters(
                        categories: categories,
                        selected: selectedCategory,
                      ),
                    ),
                  products.isEmpty
                      ? const SliverFillRemaining(child: AppEmptyWidget())
                      : _ProductGrid(products: products),
                  if (isLoadingMore)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: AppPadding.p16,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              ),
        ),
      ),
    );
  }
}

class _BrandAppBar extends StatelessWidget {
  final Brand brand;
  const _BrandAppBar({required this.brand});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          brand.name,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: brand.logoUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: brand.logoUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    Container(color: AppColors.primaryContainer),
                errorWidget: (_, __, ___) =>
                    Container(color: AppColors.primaryContainer),
              )
            : Container(color: AppColors.primaryContainer),
      ),
    );
  }
}

class _CategoryFilters extends StatelessWidget {
  final List<String> categories;
  final String? selected;

  const _CategoryFilters({required this.categories, required this.selected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: AppPadding.horizontal16,
        children: [
          _FilterChip(
            label: 'All',
            isSelected: selected == null,
            onTap: () => context
                .read<BrandDetailBloc>()
                .add(const BrandDetailEvent.selectCategory(null)),
          ),
          ...categories.map(
            (cat) => _FilterChip(
              label: cat,
              isSelected: selected == cat,
              onTap: () => context
                  .read<BrandDetailBloc>()
                  .add(BrandDetailEvent.selectCategory(cat)),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.space8),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.space16,
            vertical: AppSizes.space8,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.grey100,
            borderRadius: AppRadius.circular100,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.grey700,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductGrid extends StatelessWidget {
  final List<Product> products;
  const _ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppPadding.p16,
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSizes.space12,
          mainAxisSpacing: AppSizes.space12,
          childAspectRatio: 0.72,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _ProductCard(product: products[index]),
          childCount: products.length,
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                placeholder: (_, __) =>
                    Container(color: AppColors.grey100),
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
    );
  }
}
