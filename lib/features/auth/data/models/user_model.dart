import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/auth/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String email,
    @JsonKey(name: 'display_name') String? name,
    @JsonKey(name: 'photo_url') String? avatar,
    @JsonKey(name: 'height_cm') double? heightCm,
    @JsonKey(name: 'weight_kg') double? weightKg,
    @JsonKey(name: 'chest_cm') double? chestCm,
    @JsonKey(name: 'waist_cm') double? waistCm,
    @JsonKey(name: 'hips_cm') double? hipsCm,
    @JsonKey(name: 'clothing_size') String? clothingSize,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  User toEntity() => User(
        id: id.toString(),
        email: email,
        name: name,
        avatar: avatar,
        heightCm: heightCm,
        weightKg: weightKg,
        chestCm: chestCm,
        waistCm: waistCm,
        hipsCm: hipsCm,
        clothingSize: clothingSize,
      );
}
