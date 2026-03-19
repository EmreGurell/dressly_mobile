import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? name,
    String? avatar,
    double? heightCm,
    double? weightKg,
    double? chestCm,
    double? waistCm,
    double? hipsCm,
    String? clothingSize,
  }) = _User;
}

