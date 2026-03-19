import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/data/models/feed_model.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/saved/data/datasources/remote/saved_remote_datasource.dart';
import 'package:ai_try_on/features/saved/domain/repositories/saved_repository.dart';

class SavedRepositoryImpl implements SavedRepository {
  final SavedRemoteDataSource _remote;
  SavedRepositoryImpl(this._remote);

  AppException _mapError(Object e) {
    if (e is DioException && e.error is AppException) return e.error as AppException;
    if (e is AppException) return e;
    return const UnknownException();
  }

  @override
  Future<Either<Failure, List<Product>>> getSaved() async {
    try {
      final models = await _remote.getSaved();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeSaved(int productId) async {
    try {
      await _remote.removeSaved(productId);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }
}
