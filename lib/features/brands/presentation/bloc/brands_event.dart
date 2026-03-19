import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands_event.freezed.dart';

@freezed
sealed class BrandsEvent with _$BrandsEvent {
  const factory BrandsEvent.fetchBrands() = _FetchBrands;
}
