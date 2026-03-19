import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/shared/services/auth_service.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_event.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_state.dart';
import 'package:ai_try_on/features/feed/presentation/widgets/feed_actions.dart';
import 'package:ai_try_on/features/feed/presentation/widgets/product_card.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<FeedBloc>(),
      child: const _FeedView(),
    );
  }
}

class _FeedView extends StatefulWidget {
  const _FeedView();

  @override
  State<_FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<_FeedView> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_onScroll);
    final bloc = sl<FeedBloc>();
    final shouldLoad = bloc.state.maybeWhen(initial: () => true, orElse: () => false);
    if (shouldLoad) {
      bloc.add(const FeedEvent.loadFeed());
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentIndex) {
      setState(() => _currentIndex = page);
    }
    final state = context.read<FeedBloc>().state;
    state.maybeWhen(
      loaded: (products, _, hasMore) {
        if (page >= products.length - 2 && hasMore) {
          context.read<FeedBloc>().add(const FeedEvent.loadMoreFeed());
        }
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      body: BlocListener<FeedBloc, FeedState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (msg) {
              if (msg.toLowerCase().contains('unauthorized') ||
                  msg.toLowerCase().contains('401')) {
                sl<AuthService>().logout().then((_) {
                  if (context.mounted) context.go(AppRoutes.login);
                });
              }
            },
          );
        },
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const AppLoadingWidget(),
            error: (msg) => AppErrorWidget(
              message: msg,
              onRetry: () => context.read<FeedBloc>().add(const FeedEvent.loadFeed()),
            ),
            loaded: (products, _, __) => _buildFeed(context, products),
          ),
        ),
      ),
    );
  }

  Widget _buildFeed(BuildContext context, List<Product> products) {
    final product = products.isNotEmpty
        ? products[_currentIndex.clamp(0, products.length - 1)]
        : null;

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: products.length,
          itemBuilder: (_, index) => ProductCard(product: products[index]),
        ),
        if (product != null)
          Positioned(
            right: AppSizes.space12,
            bottom: MediaQuery.heightOf(context) * 0.2,
            child: FeedActions(
              product: product,
              onLike: () =>
                  context.read<FeedBloc>().add(FeedEvent.likeProduct(product.id)),
              onSave: () =>
                  context.read<FeedBloc>().add(FeedEvent.saveProduct(product.id)),
              onTryOn: () => context.push(AppRoutes.tryon, extra: product),
            ),
          ),
      ],
    );
  }
}
