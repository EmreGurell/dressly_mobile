import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/data/datasources/remote/feed_remote_datasource.dart';
import 'package:ai_try_on/features/feed/data/models/feed_model.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource _remote;
  FeedRepositoryImpl(this._remote);

  AppException _mapError(Object e) {
    if (e is DioException && e.error is AppException) return e.error as AppException;
    if (e is AppException) return e;
    return const UnknownException();
  }

  @override
  Future<Either<Failure, List<Product>>> getFeed(int page) async {
    try {
      final models = await _remote.getFeed(page);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> likeProduct(int productId) async {
    try {
      await _remote.likeProduct(productId);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveProduct(int productId) async {
    try {
      await _remote.saveProduct(productId);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> refreshFeed() async {
    try {
      await _remote.refreshFeed();
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getRecommendations() async {
    try {
      final models = await _remote.getRecommendations();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }
}
