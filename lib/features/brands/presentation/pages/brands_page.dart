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
import 'package:ai_try_on/shared/theme/app_colors.dart';
import 'package:ai_try_on/shared/theme/app_padding.dart';
import 'package:ai_try_on/shared/theme/app_radius.dart';
import 'package:ai_try_on/shared/theme/app_sizes.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

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
      appBar: AppBar(title: const Text('Brands')),
      body: BlocBuilder<BrandsBloc, BrandsState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const AppLoadingWidget(),
          error: (msg) => AppErrorWidget(
            message: msg,
            onRetry: () =>
                context.read<BrandsBloc>().add(const BrandsEvent.fetchBrands()),
          ),
          loaded: (brands) => brands.isEmpty
              ? const AppEmptyWidget()
              : _BrandsGrid(brands: brands),
        ),
      ),
    );
  }
}

class _BrandsGrid extends StatelessWidget {
  final List<Brand> brands;
  const _BrandsGrid({required this.brands});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppPadding.p16,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.space12,
        mainAxisSpacing: AppSizes.space12,
        childAspectRatio: 0.85,
      ),
      itemCount: brands.length,
      itemBuilder: (context, index) => _BrandCard(brand: brands[index]),
    );
  }
}

class _BrandCard extends StatelessWidget {
  final Brand brand;
  const _BrandCard({required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        AppRoutes.brandDetail(brand.id.toString()),
        extra: brand,
      ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: AppRadius.circular100,
              child: CachedNetworkImage(
                imageUrl: brand.logoUrl,
                width: AppSizes.space48 * 2,
                height: AppSizes.space48 * 2,
                fit: BoxFit.cover,
                placeholder: (_, __) => const _LogoPlaceholder(),
                errorWidget: (_, __, ___) => const _LogoPlaceholder(),
              ),
            ),
            const SizedBox(height: AppSizes.space12),
            Padding(
              padding: AppPadding.horizontal12,
              child: Text(
                brand.name,
                style: context.appTextTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (brand.productCount > 0) ...[
              const SizedBox(height: AppSizes.space4),
              Text(
                '${brand.productCount} products',
                style: context.appTextTheme.bodySmall?.copyWith(
                      color: AppColors.grey500,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LogoPlaceholder extends StatelessWidget {
  const _LogoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.space48 * 2,
      height: AppSizes.space48 * 2,
      color: AppColors.grey100,
      child: PhosphorIcon(PhosphorIcons.storefront(), color: AppColors.grey400),
    );
  }
}
