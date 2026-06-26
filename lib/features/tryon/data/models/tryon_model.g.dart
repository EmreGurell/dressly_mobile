// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tryon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TryonResultModel _$TryonResultModelFromJson(Map<String, dynamic> json) =>
    _TryonResultModel(
      id: (json['id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productImageUrl: json['product_image_url'] as String,
      userPhotoUrl: json['user_photo_url'] as String,
      status: json['status'] as String,
      resultImageUrl: json['result_image_url'] as String?,
      errorMessage: json['error_message'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$TryonResultModelToJson(_TryonResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_image_url': instance.productImageUrl,
      'user_photo_url': instance.userPhotoUrl,
      'status': instance.status,
      'result_image_url': instance.resultImageUrl,
      'error_message': instance.errorMessage,
      'created_at': instance.createdAt,
    };
