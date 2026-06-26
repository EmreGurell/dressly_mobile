import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/tryon/data/datasources/remote/tryon_remote_datasource.dart';
import 'package:ai_try_on/features/tryon/data/models/tryon_model.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';
import 'package:ai_try_on/features/tryon/domain/repositories/tryon_repository.dart';

class TryonRepositoryImpl implements TryonRepository {
  final TryonRemoteDataSource _remote;
  final _log = Logger();
  TryonRepositoryImpl(this._remote);

  AppException _mapError(Object e) {
    if (e is DioException) {
      if (e.error is AppException) return e.error as AppException;
      final status = e.response?.statusCode;
      final body = e.response?.data;
      final msg = body is Map
          ? (body['message'] ?? body['error']?['message'] ?? body.toString())
          : body?.toString() ?? e.message ?? 'API hatası';
      return ServerException('$status: $msg');
    }
    if (e is AppException) return e;
    return UnknownException(e.toString());
  }

  @override
  Future<Either<Failure, TryonResult>> createTryOn({
    required int productId,
    required XFile userPhoto,
  }) async {
    try {
      final model = await _remote.createTryOn(
        productId: productId,
        userPhoto: userPhoto,
      );
      return Right(model.toEntity());
    } catch (e, st) {
      _log.e('TryonRepository.createTryOn error', error: e, stackTrace: st);
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, TryonResult>> getTryOnStatus(int tryonId) async {
    try {
      final model = await _remote.getTryOnStatus(tryonId);
      return Right(model.toEntity());
    } catch (e, st) {
      _log.e('TryonRepository.getTryOnStatus error', error: e, stackTrace: st);
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, List<TryonResult>>> listTryOns() async {
    try {
      final models = await _remote.listTryOns();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e, st) {
      _log.e('TryonRepository.listTryOns error', error: e, stackTrace: st);
      return Left(_mapError(e).toFailure());
    }
  }
}
