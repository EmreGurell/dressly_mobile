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
      gender: json['gender'] as String?,
      isOnboarded: json['is_onboarded'] as bool? ?? false,
      heightCm: (json['height_cm'] as num?)?.toInt(),
      weightKg: (json['weight_kg'] as num?)?.toInt(),
      chestCm: (json['chest_cm'] as num?)?.toInt(),
      waistCm: (json['waist_cm'] as num?)?.toInt(),
      hipsCm: (json['hips_cm'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'display_name': instance.name,
      'photo_url': instance.avatar,
      'gender': instance.gender,
      'is_onboarded': instance.isOnboarded,
      'height_cm': instance.heightCm,
      'weight_kg': instance.weightKg,
      'chest_cm': instance.chestCm,
      'waist_cm': instance.waistCm,
      'hips_cm': instance.hipsCm,
    };
