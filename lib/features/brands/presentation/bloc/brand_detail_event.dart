import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';

part 'brand_detail_event.freezed.dart';

@freezed
sealed class BrandDetailEvent with _$BrandDetailEvent {
  const factory BrandDetailEvent.load(Brand brand) = _Load;
  const factory BrandDetailEvent.selectCategory(String? category) = _SelectCategory;
  const factory BrandDetailEvent.loadMore() = _LoadMore;
  const factory BrandDetailEvent.search(String query) = _Search;
}
