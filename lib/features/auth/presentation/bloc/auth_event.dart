import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = _LoginRequested;

  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    required String name,
  }) = _RegisterRequested;

  const factory AuthEvent.loginWithGoogleRequested() = _LoginWithGoogleRequested;

  const factory AuthEvent.loginWithAppleRequested() = _LoginWithAppleRequested;

  const factory AuthEvent.logoutRequested() = _LogoutRequested;

  const factory AuthEvent.getMeRequested() = _GetMeRequested;

  const factory AuthEvent.updateMeasurementsRequested({
    double? heightCm,
    double? weightKg,
    double? chestCm,
    double? waistCm,
    double? hipsCm,
    String? clothingSize,
  }) = _UpdateMeasurementsRequested;
}

