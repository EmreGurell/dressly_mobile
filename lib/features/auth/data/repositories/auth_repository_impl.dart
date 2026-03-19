import 'package:dio/dio.dart';
import 'package:ai_try_on/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:ai_try_on/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:ai_try_on/features/auth/domain/entities/user.dart';
import 'package:ai_try_on/features/auth/domain/repositories/auth_repository.dart';
import 'package:ai_try_on/shared/services/secure_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;
  final SecureStorageService _secureStorage;

  AuthRepositoryImpl(this._remote, this._local, this._secureStorage);

  AppException _mapError(Object e) {
    if (e is DioException && e.error is AppException) return e.error as AppException;
    if (e is AppException) return e;
    return const UnknownException();
  }

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _remote.login(email: email, password: password);
      await _local.cacheUser(model);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final model = await _remote.register(
        email: email,
        password: password,
        name: name,
      );
      await _local.cacheUser(model);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, User>> loginWithGoogle() async {
    try {
      final model = await _remote.loginWithGoogle();
      await _local.cacheUser(model);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, User>> loginWithApple() async {
    try {
      final model = await _remote.loginWithApple();
      await _local.cacheUser(model);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remote.logout();
    } catch (_) {
      // API başarısız olsa da local temizlik yapılmalı
    }
    await _local.clearUser();
    await _secureStorage.clearAll();
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await _remote.forgotPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await _remote.verifyOtp(email: email, otp: otp);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getMe() async {
    try {
      final model = await _remote.getMe();
      await _local.cacheUser(model);
      return Right(model.toEntity());
    } catch (e) {
      // Fallback to cache
      final cached = _local.getCachedUser();
      if (cached != null) return Right(cached.toEntity());
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateMeasurements({
    double? heightCm,
    double? weightKg,
    double? chestCm,
    double? waistCm,
    double? hipsCm,
    String? clothingSize,
  }) async {
    try {
      final model = await _remote.updateMeasurements(
        heightCm: heightCm,
        weightKg: weightKg,
        chestCm: chestCm,
        waistCm: waistCm,
        hipsCm: hipsCm,
        clothingSize: clothingSize,
      );
      await _local.cacheUser(model);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }
}
