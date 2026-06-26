import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

part 'product_detail_state.freezed.dart';

@freezed
sealed class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = _Initial;
  const factory ProductDetailState.loading() = _Loading;
  const factory ProductDetailState.loaded({
    required Product product,
    @Default(false) bool isLikeLoading,
    @Default(false) bool isSaveLoading,
  }) = _Loaded;
  const factory ProductDetailState.error(String message) = _Error;
}
