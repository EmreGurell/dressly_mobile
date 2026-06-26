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
    String? gender,
    @JsonKey(name: 'is_onboarded') @Default(false) bool isOnboarded,
    @JsonKey(name: 'height_cm') int? heightCm,
    @JsonKey(name: 'weight_kg') int? weightKg,
    @JsonKey(name: 'chest_cm') int? chestCm,
    @JsonKey(name: 'waist_cm') int? waistCm,
    @JsonKey(name: 'hips_cm') int? hipsCm,
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
        gender: gender,
        isOnboarded: isOnboarded,
        heightCm: heightCm,
        weightKg: weightKg,
        chestCm: chestCm,
        waistCm: waistCm,
        hipsCm: hipsCm,
      );
}
