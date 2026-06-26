import 'package:flutter/material.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_bloc.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_event.dart';
import 'package:ai_try_on/features/saved/presentation/bloc/saved_state.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';
import 'package:ai_try_on/shared/widgets/catalog_product_card.dart';

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
    return Scaffold(
      appBar: AppBar(
        title:  Text('Wishlist',style: context.appTextTheme.headlineSmall),
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
          loaded: (products) => _WishlistTab(products: products),
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
        mainAxisExtent: 320,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          _SavedProductCard(product: products[index]),
    );
  }
}

// Swipe to delete
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
      child: CatalogProductCard(product: product),
    );
  }
}

