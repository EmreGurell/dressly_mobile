import 'package:ai_try_on/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
  });
  Future<UserModel> loginWithGoogle();
  Future<UserModel> loginWithApple();
  Future<void> logout();
  Future<void> forgotPassword(String email);
  Future<void> verifyOtp({required String email, required String otp});
  Future<UserModel> getMe();
  Future<UserModel> updateMeasurements({
    String? gender,
    int? heightCm,
    int? weightKg,
    int? chestCm,
    int? waistCm,
    int? hipsCm,
  });
}

