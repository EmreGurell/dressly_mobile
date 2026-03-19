import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/tryon/data/datasources/remote/tryon_remote_datasource.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';
import 'package:ai_try_on/features/tryon/domain/repositories/tryon_repository.dart';

import '../models/tryon_model.dart';

class TryonRepositoryImpl implements TryonRepository {
  final TryonRemoteDataSource _remote;
  TryonRepositoryImpl(this._remote);

  AppException _mapError(Object e) {
    if (e is DioException && e.error is AppException) return e.error as AppException;
    if (e is AppException) return e;
    return const UnknownException();
  }

  @override
  Future<Either<Failure, TryonResult>> tryOn({
    required XFile userPhoto,
    required int productId,
  }) async {
    try {
      final model = await _remote.tryOn(userPhoto: userPhoto, productId: productId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }
}
