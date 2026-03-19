import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';

part 'brands_model.freezed.dart';
part 'brands_model.g.dart';

@freezed
sealed class BrandModel with _$BrandModel {
  const factory BrandModel({
    required int id,
    required String name,
    @JsonKey(name: 'logo_url') required String logoUrl,
    @JsonKey(name: 'product_count') @Default(0) int productCount,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

extension BrandModelX on BrandModel {
  Brand toEntity() => Brand(
        id: id,
        name: name,
        logoUrl: logoUrl,
        productCount: productCount,
      );
}
