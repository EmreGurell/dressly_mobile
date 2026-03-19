import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/domain/usecases/feed_usecases.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_event.dart';
import 'package:ai_try_on/features/feed/presentation/bloc/feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final GetFeedUseCase _getFeed;
  final LikeProductUseCase _likeProduct;
  final SaveProductUseCase _saveProduct;
  final RefreshFeedUseCase _refreshFeed;

  FeedBloc({
    required GetFeedUseCase getFeed,
    required LikeProductUseCase likeProduct,
    required SaveProductUseCase saveProduct,
    required RefreshFeedUseCase refreshFeed,
  })  : _getFeed = getFeed,
        _likeProduct = likeProduct,
        _saveProduct = saveProduct,
        _refreshFeed = refreshFeed,
        super(const FeedState.initial()) {
    on<FeedEvent>((event, emit) async {
      await event.when(
        loadFeed: () => _onLoadFeed(emit),
        refreshFeed: () => _onRefreshFeed(emit),
        loadMoreFeed: () => _onLoadMoreFeed(emit),
        likeProduct: (id) => _onLikeProduct(id, emit),
        saveProduct: (id) => _onSaveProduct(id, emit),
      );
    });
  }

  Future<void> _onRefreshFeed(Emitter<FeedState> emit) async {
    emit(const FeedState.loading());
    await _refreshFeed(); // POST /feed/refresh/ — backend arka planda işler
    final result = await _getFeed(1);
    result.fold(
      (failure) => emit(FeedState.error(failure.message)),
      (products) => emit(FeedState.loaded(
        products: products,
        currentPage: 1,
        hasMore: products.length >= 10,
      )),
    );
  }

  Future<void> _onLoadFeed(Emitter<FeedState> emit) async {
    emit(const FeedState.loading());
    final result = await _getFeed(1);
    result.fold(
      (failure) => emit(FeedState.error(failure.message)),
      (products) => emit(FeedState.loaded(
        products: products,
        currentPage: 1,
        hasMore: products.length >= 10,
      )),
    );
  }

  Future<void> _onLoadMoreFeed(Emitter<FeedState> emit) async {
    final isLoaded = state.maybeWhen(
      loaded: (products, page, hasMore) => hasMore ? (products, page) : null,
      orElse: () => null,
    );
    if (isLoaded == null) return;

    final (currentProducts, currentPage) = isLoaded;
    final result = await _getFeed(currentPage + 1);
    result.fold(
      (failure) => emit(FeedState.error(failure.message)),
      (newProducts) => emit(FeedState.loaded(
        products: [...currentProducts, ...newProducts],
        currentPage: currentPage + 1,
        hasMore: newProducts.length >= 10,
      )),
    );
  }

  Future<void> _onLikeProduct(int productId, Emitter<FeedState> emit) async {
    final before = state;
    final updated = _updateProduct(
      productId,
      (p) => p.copyWith(
        isLiked: !p.isLiked,
        likeCount: p.isLiked ? p.likeCount - 1 : p.likeCount + 1,
      ),
    );
    if (updated == null) return;
    emit(updated); // optimistic update

    final result = await _likeProduct(productId);
    result.fold(
      (_) => emit(before), // hata → eski state'e geri dön
      (_) => null,
    );
  }

  Future<void> _onSaveProduct(int productId, Emitter<FeedState> emit) async {
    final before = state;
    final updated = _updateProduct(
      productId,
      (p) => p.copyWith(
        isSaved: !p.isSaved,
        saveCount: p.isSaved ? p.saveCount - 1 : p.saveCount + 1,
      ),
    );
    if (updated == null) return;
    emit(updated); // optimistic update

    final result = await _saveProduct(productId);
    result.fold(
      (_) => emit(before), // hata → eski state'e geri dön
      (_) => null,
    );
  }

  FeedState? _updateProduct(int productId, Product Function(Product) update) {
    return state.maybeWhen(
      loaded: (products, page, hasMore) => FeedState.loaded(
        products: products.map((p) => p.id == productId ? update(p) : p).toList(),
        currentPage: page,
        hasMore: hasMore,
      ),
      orElse: () => null,
    );
  }
}
