import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

part 'brands_state.freezed.dart';

@freezed
sealed class BrandsState with _$BrandsState {
  const factory BrandsState.initial() = _Initial;
  const factory BrandsState.loading() = _Loading;
  const factory BrandsState.loaded({
    required List<Brand> brands,
    required List<Product> products,
    Brand? selectedBrand,
    String? selectedCategory,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingProducts,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;
  const factory BrandsState.error(String message) = _Error;
}
