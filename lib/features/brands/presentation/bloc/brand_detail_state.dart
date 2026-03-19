import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

part 'brand_detail_state.freezed.dart';

@freezed
sealed class BrandDetailState with _$BrandDetailState {
  const factory BrandDetailState.initial() = _Initial;
  const factory BrandDetailState.loading() = _Loading;
  const factory BrandDetailState.loaded({
    required Brand brand,
    required List<Product> products,
    required List<String> categories,
    required String? selectedCategory,
    required int currentPage,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;
  const factory BrandDetailState.error(String message) = _Error;
}
