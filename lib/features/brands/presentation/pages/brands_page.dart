import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_bloc.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_event.dart';
import 'package:ai_try_on/features/brands/presentation/bloc/brands_state.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';
import 'package:ai_try_on/core/extensions/l10n_extension.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BrandsBloc>()..add(const BrandsEvent.fetchBrands()),
      child: const _BrandsView(),
    );
  }
}

class _BrandsView extends StatelessWidget {
  const _BrandsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BrandsBloc, BrandsState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const AppLoadingWidget(),
          error: (msg) => AppErrorWidget(
            message: msg,
            onRetry: () =>
                context.read<BrandsBloc>().add(const BrandsEvent.fetchBrands()),
          ),
          loaded: (brands, _, __, ___, ____, _____, ______, _______) =>
              _BannerList(brands: brands),
        ),
      ),
    );
  }
}

class _BannerList extends StatelessWidget {
  final List<Brand> brands;
  const _BannerList({required this.brands});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text(
            context.l10n.brandsTitle,
            style: context.appTextTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SliverPadding(
          padding: AppPadding.p16,
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Tümü banner
              _BrandBanner(
                label: context.l10n.allBrandsBanner,
                logoUrl: null,
                onTap: () => context.push(AppRoutes.allProducts),
              ),
              const SizedBox(height: AppSizes.space12),
              // Marka bannerları
              ...brands.map(
                (brand) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSizes.space12),
                  child: _BrandBanner(
                    label: brand.name,
                    logoUrl: brand.logoUrl.isNotEmpty ? brand.logoUrl : null,
                    productCount: brand.productCount,
                    onTap: () => context.push(
                      AppRoutes.brandDetail(brand.id.toString()),
                      extra: brand,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

String? _localBannerAsset(String label) {
  final key = label.toLowerCase().trim();
  const map = {
    'zara': 'assets/images/zara_bg.png',
    'h&m': 'assets/images/hm_bg.png',
    'pull & bear': 'assets/images/pb_bg.png',
    'bershka': 'assets/images/bershka_bg.png',
  };
  return map[key];
}

class _BrandBanner extends StatelessWidget {
  final String label;
  final String? logoUrl;
  final int? productCount;
  final VoidCallback onTap;

  const _BrandBanner({
    required this.label,
    required this.logoUrl,
    required this.onTap,
    this.productCount,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final localAsset = _localBannerAsset(label);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular12,
          border: Border.all(color: cs.outlineVariant),
        ),
        child: ClipRRect(
          borderRadius: AppRadius.circular12,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Arka plan
              if (localAsset != null)
                Image.asset(localAsset, fit: BoxFit.cover)
              else if (logoUrl != null)
                CachedNetworkImage(
                  imageUrl: logoUrl!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                      Container(color: cs.surfaceContainerHighest),
                  errorWidget: (_, __, ___) =>
                      Container(color: cs.surfaceContainerHighest),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [cs.primaryContainer, cs.secondaryContainer],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),

              // Karanlık overlay
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xAA000000),
                      Color(0x44000000),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),

              // İçerik
              Padding(
                padding: AppPadding.p16,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label.toUpperCase(),
                            style:
                                context.appTextTheme.titleMedium?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          if (productCount != null && productCount! > 0) ...[
                            const SizedBox(height: AppSizes.space4),
                            Text(
                              context.l10n.productCount(productCount!),
                              style: context.appTextTheme.bodySmall?.copyWith(
                                color: AppColors.white.withValues(alpha: 0.75),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIcons.caretRight(),
                      color: AppColors.white.withValues(alpha: 0.75),
                      size: AppSizes.iconMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
