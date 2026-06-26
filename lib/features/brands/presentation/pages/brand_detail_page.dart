import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_bloc.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_event.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brand_detail_state.dart';
import 'package:ai_try_on/shared/theme/app_colors.dart';
import 'package:ai_try_on/shared/theme/app_padding.dart';
import 'package:ai_try_on/shared/theme/app_radius.dart';
import 'package:ai_try_on/shared/theme/app_sizes.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';
import 'package:ai_try_on/shared/widgets/catalog_product_card.dart';

class BrandDetailPage extends StatelessWidget {
  final Brand brand;
  const BrandDetailPage({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BrandDetailBloc>()..add(BrandDetailEvent.load(brand)),
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
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchController.addListener(() { if (mounted) setState(() {}); });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<BrandDetailBloc>().add(const BrandDetailEvent.loadMore());
    }
  }

  void _onSearch(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<BrandDetailBloc>().add(BrandDetailEvent.search(query));
    });
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
          loaded: (brand, products, categories, selectedCategory, _, hasMore,
                  isLoadingMore) {
            final q = _searchController.text.toLowerCase();
            final displayProducts = q.isEmpty
                ? products
                : products.where((p) => p.name.toLowerCase().contains(q)).toList();
            return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                title: Text(
                  brand.name,
                  style: context.appTextTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: _SearchBar(
                      controller: _searchController,
                      onChanged: _onSearch,
                    ),
                  ),
                ),
              ),
              if (categories.isNotEmpty)
                SliverPersistentHeader(
                  pinned: false,
                  delegate: _CategoryHeaderDelegate(
                    categories: categories,
                    selected: selectedCategory,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    onSelected: (cat) => context
                        .read<BrandDetailBloc>()
                        .add(BrandDetailEvent.selectCategory(cat)),
                  ),
                ),
              if (displayProducts.isEmpty && isLoadingMore)
                const SliverFillRemaining(child: AppLoadingWidget())
              else if (displayProducts.isEmpty)
                const SliverFillRemaining(child: AppEmptyWidget())
              else
                SliverPadding(
                  padding: AppPadding.p16,
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppSizes.space12,
                      mainAxisSpacing: AppSizes.space12,
                      mainAxisExtent: 320,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          CatalogProductCard(product: displayProducts[index]),
                      childCount: displayProducts.length,
                    ),
                  ),
                ),
              if (isLoadingMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: AppPadding.p16,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              const SliverToBoxAdapter(
                  child: SizedBox(height: AppSizes.space16)),
            ],
          );
          },
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const _SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      style: TextStyle(color: cs.onSurface),
      decoration: InputDecoration(
        hintText: 'Ürün ara...',
        hintStyle: context.appTextTheme.bodyMedium
            ?.copyWith(color: cs.onSurfaceVariant),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: PhosphorIcon(PhosphorIcons.magnifyingGlass(),
              size: 20, color: cs.onSurfaceVariant),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0),
        suffixIcon: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, value, __) => value.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: PhosphorIcon(PhosphorIcons.x(),
                      size: 18, color: cs.onSurfaceVariant),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                ),
        ),
        filled: true,
        fillColor: cs.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular12,
          borderSide: BorderSide(color: cs.onSurface, width: 1.5),
        ),
      ),
    );
  }
}

class _CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<String> categories;
  final String? selected;
  final Color backgroundColor;
  final ValueChanged<String?> onSelected;

  const _CategoryHeaderDelegate({
    required this.categories,
    required this.selected,
    required this.backgroundColor,
    required this.onSelected,
  });

  @override
  double get minExtent => 52;
  @override
  double get maxExtent => 52;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.space8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: AppPadding.horizontal16,
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.space8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _Chip(
                label: 'Tümü',
                isSelected: selected == null,
                onTap: () => onSelected(null));
          }
          final cat = categories[index - 1];
          return _Chip(
              label: cat,
              isSelected: selected == cat,
              onTap: () => onSelected(cat));
        },
      ),
    );
  }

  @override
  bool shouldRebuild(_CategoryHeaderDelegate old) => true;
}

class _Chip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _Chip(
      {required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.space16, vertical: AppSizes.space8),
        decoration: BoxDecoration(
          color: isSelected ? cs.onSurface : AppColors.transparent,
          borderRadius: AppRadius.circular100,
          border:
              Border.all(color: isSelected ? cs.onSurface : cs.outlineVariant),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? cs.surface : cs.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
