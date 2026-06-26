import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/brands/data/datasources/remote/brands_remote_datasource.dart';
import 'package:ai_try_on/features/brands/data/models/brands_model.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/domain/repositories/brands_repository.dart';
import 'package:ai_try_on/features/feed/data/models/feed_model.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

class BrandsRepositoryImpl implements BrandsRepository {
  final BrandsRemoteDataSource _remote;
  BrandsRepositoryImpl(this._remote);

  AppException _mapError(Object e) {
    if (e is DioException && e.error is AppException) return e.error as AppException;
    if (e is AppException) return e;
    return const UnknownException();
  }

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    try {
      final models = await _remote.getBrands();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts(int page, {String? search}) async {
    try {
      final models = await _remote.getProducts(page, search: search);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getBrandProducts(
    int brandId,
    int page, {
    String? category,
    String? search,
  }) async {
    try {
      final models = await _remote.getBrandProducts(brandId, page, category: category, search: search);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }
}
