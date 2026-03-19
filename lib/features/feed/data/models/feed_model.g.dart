// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brandName: json['brand_name'] as String,
      price: _parseDouble(json['price']),
      imageUrl: json['image_url'] as String,
      category: json['category'] as String,
      brandLogoUrl: json['brand_logo_url'] as String? ?? '',
      likeCount: (json['like_count'] as num?)?.toInt() ?? 0,
      saveCount: (json['save_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      isSaved: json['is_saved'] as bool? ?? false,
      productUrl: json['product_url'] as String? ?? '',
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand_name': instance.brandName,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'category': instance.category,
      'brand_logo_url': instance.brandLogoUrl,
      'like_count': instance.likeCount,
      'save_count': instance.saveCount,
      'is_liked': instance.isLiked,
      'is_saved': instance.isSaved,
      'product_url': instance.productUrl,
    };
