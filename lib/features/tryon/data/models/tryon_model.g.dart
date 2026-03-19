// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tryon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TryonResultModel _$TryonResultModelFromJson(Map<String, dynamic> json) =>
    _TryonResultModel(
      id: (json['id'] as num).toInt(),
      resultImageUrl: json['result_image_url'] as String,
      productId: (json['product_id'] as num).toInt(),
    );

Map<String, dynamic> _$TryonResultModelToJson(_TryonResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result_image_url': instance.resultImageUrl,
      'product_id': instance.productId,
    };
