import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/auth/domain/entities/user.dart';
import 'package:ai_try_on/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;
  LoginUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) =>
      _repository.login(email: email, password: password);
}

class RegisterUseCase {
  final AuthRepository _repository;
  RegisterUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
  }) =>
      _repository.register(email: email, password: password, name: name);
}

class LogoutUseCase {
  final AuthRepository _repository;
  LogoutUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.logout();
}

class LoginWithGoogleUseCase {
  final AuthRepository _repository;
  LoginWithGoogleUseCase(this._repository);

  Future<Either<Failure, User>> call() => _repository.loginWithGoogle();
}

class LoginWithAppleUseCase {
  final AuthRepository _repository;
  LoginWithAppleUseCase(this._repository);

  Future<Either<Failure, User>> call() => _repository.loginWithApple();
}

class GetMeUseCase {
  final AuthRepository _repository;
  GetMeUseCase(this._repository);

  Future<Either<Failure, User>> call() => _repository.getMe();
}

class UpdateMeasurementsUseCase {
  final AuthRepository _repository;
  UpdateMeasurementsUseCase(this._repository);

  Future<Either<Failure, User>> call({
    double? heightCm,
    double? weightKg,
    double? chestCm,
    double? waistCm,
    double? hipsCm,
    String? clothingSize,
  }) =>
      _repository.updateMeasurements(
        heightCm: heightCm,
        weightKg: weightKg,
        chestCm: chestCm,
        waistCm: waistCm,
        hipsCm: hipsCm,
        clothingSize: clothingSize,
      );
}

