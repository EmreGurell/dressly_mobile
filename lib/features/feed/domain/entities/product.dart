import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
sealed class Product with _$Product {
  const factory Product({
    required int id,
    required String brandName,
    required String name,
    required double price,
    required String imageUrl,
    required String category,
    @Default('') String brandLogoUrl,
    @Default(0) int likeCount,
    @Default(0) int saveCount,
    @Default(false) bool isLiked,
    @Default(false) bool isSaved,
    @Default('') String productUrl,
  }) = _Product;
}
