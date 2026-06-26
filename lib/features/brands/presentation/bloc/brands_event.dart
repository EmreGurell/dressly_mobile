import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';

part 'brands_event.freezed.dart';

@freezed
sealed class BrandsEvent with _$BrandsEvent {
  const factory BrandsEvent.fetchBrands() = _FetchBrands;
  const factory BrandsEvent.selectAllBrands() = _SelectAllBrands;
  const factory BrandsEvent.selectBrand(Brand brand) = _SelectBrand;
  const factory BrandsEvent.selectCategory(String? category) = _SelectCategory;
  const factory BrandsEvent.loadMoreProducts() = _LoadMoreProducts;
  const factory BrandsEvent.search(String query) = _Search;
}
