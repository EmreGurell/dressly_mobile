import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

double _parseDouble(dynamic value) => double.parse(value.toString());

@freezed
sealed class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String name,
    @JsonKey(name: 'brand_name') required String brandName,
    @JsonKey(fromJson: _parseDouble) required double price,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'image_url') required String imageUrl,
    required String category,
    @JsonKey(name: 'brand_logo_url') @Default('') String brandLogoUrl,
    @JsonKey(name: 'like_count') @Default(0) int likeCount,
    @JsonKey(name: 'save_count') @Default(0) int saveCount,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'is_saved') @Default(false) bool isSaved,
    @JsonKey(name: 'product_url') @Default('') String productUrl,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelX on ProductModel {
  Product toEntity() => Product(
        id: id,
        brandName: brandName,
        name: name,
        price: price,
        imageUrl: imageUrl,
        category: category,
        brandLogoUrl: brandLogoUrl,
        likeCount: likeCount,
        saveCount: saveCount,
        isLiked: isLiked,
        isSaved: isSaved,
        productUrl: productUrl,
      );
}
