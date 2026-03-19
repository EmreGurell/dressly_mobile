import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';

part 'brands_state.freezed.dart';

@freezed
sealed class BrandsState with _$BrandsState {
  const factory BrandsState.initial() = _Initial;
  const factory BrandsState.loading() = _Loading;
  const factory BrandsState.loaded(List<Brand> brands) = _Loaded;
  const factory BrandsState.error(String message) = _Error;
}
