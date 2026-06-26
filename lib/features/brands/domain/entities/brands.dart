import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands.freezed.dart';

@freezed
sealed class Brand with _$Brand {
  const factory Brand({
    required int id,
    required String name,
    required String logoUrl,
    @Default('') String websiteUrl,
    @Default(0) int productCount,
  }) = _Brand;
}
