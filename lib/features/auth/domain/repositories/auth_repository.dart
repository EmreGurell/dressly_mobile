import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, User>> loginWithGoogle();

  Future<Either<Failure, User>> loginWithApple();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword(String email);

  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Either<Failure, User>> getMe();
  Future<Either<Failure, User>> updateMeasurements({
    double? heightCm,
    double? weightKg,
    double? chestCm,
    double? waistCm,
    double? hipsCm,
    String? clothingSize,
  });
}

