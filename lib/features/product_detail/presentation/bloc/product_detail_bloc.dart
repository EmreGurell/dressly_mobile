import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/feed/domain/usecases/feed_usecases.dart';
import 'package:ai_try_on/features/product_detail/domain/usecases/get_product_detail_usecase.dart';
import 'package:ai_try_on/features/product_detail/presentation/bloc/product_detail_event.dart';
import 'package:ai_try_on/features/product_detail/presentation/bloc/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetailUseCase _getProductDetail;
  final LikeProductUseCase _likeProduct;
  final SaveProductUseCase _saveProduct;

  ProductDetailBloc({
    required GetProductDetailUseCase getProductDetail,
    required LikeProductUseCase likeProduct,
    required SaveProductUseCase saveProduct,
  })  : _getProductDetail = getProductDetail,
        _likeProduct = likeProduct,
        _saveProduct = saveProduct,
        super(const ProductDetailState.initial()) {
    on<ProductDetailEvent>((event, emit) async {
      await event.when(
        load: (id) => _onLoad(id, emit),
        toggleLike: () => _onToggleLike(emit),
        toggleSave: () => _onToggleSave(emit),
      );
    });
  }

  Future<void> _onLoad(int id, Emitter<ProductDetailState> emit) async {
    emit(const ProductDetailState.loading());
    final result = await _getProductDetail(id);
    result.fold(
      (failure) => emit(ProductDetailState.error(failure.message)),
      (product) => emit(ProductDetailState.loaded(product: product)),
    );
  }

  Future<void> _onToggleLike(Emitter<ProductDetailState> emit) async {
    final current = state.maybeWhen(
      loaded: (product, isLikeLoading, _) =>
          isLikeLoading ? null : (product: product),
      orElse: () => null,
    );
    if (current == null) return;

    final p = current.product;
    final wasLiked = p.isLiked;
    final optimistic = p.copyWith(
      isLiked: !wasLiked,
      likeCount: wasLiked ? p.likeCount - 1 : p.likeCount + 1,
    );

    emit(ProductDetailState.loaded(product: optimistic, isLikeLoading: true));

    final result = await _likeProduct(p.id);
    result.fold(
      (_) => emit(ProductDetailState.loaded(product: p)),
      (_) => emit(ProductDetailState.loaded(product: optimistic)),
    );
  }

  Future<void> _onToggleSave(Emitter<ProductDetailState> emit) async {
    final current = state.maybeWhen(
      loaded: (product, _, isSaveLoading) =>
          isSaveLoading ? null : (product: product),
      orElse: () => null,
    );
    if (current == null) return;

    final p = current.product;
    final wasSaved = p.isSaved;
    final optimistic = p.copyWith(
      isSaved: !wasSaved,
      saveCount: wasSaved ? p.saveCount - 1 : p.saveCount + 1,
    );

    emit(ProductDetailState.loaded(product: optimistic, isSaveLoading: true));

    final result = await _saveProduct(p.id);
    result.fold(
      (_) => emit(ProductDetailState.loaded(product: p)),
      (_) => emit(ProductDetailState.loaded(product: optimistic)),
    );
  }
}
