// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['display_name'] as String?,
      avatar: json['photo_url'] as String?,
      heightCm: (json['height_cm'] as num?)?.toDouble(),
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      chestCm: (json['chest_cm'] as num?)?.toDouble(),
      waistCm: (json['waist_cm'] as num?)?.toDouble(),
      hipsCm: (json['hips_cm'] as num?)?.toDouble(),
      clothingSize: json['clothing_size'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'display_name': instance.name,
      'photo_url': instance.avatar,
      'height_cm': instance.heightCm,
      'weight_kg': instance.weightKg,
      'chest_cm': instance.chestCm,
      'waist_cm': instance.waistCm,
      'hips_cm': instance.hipsCm,
      'clothing_size': instance.clothingSize,
    };
