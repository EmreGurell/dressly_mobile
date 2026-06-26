import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/product_detail/data/datasources/remote/product_detail_remote_datasource.dart';
import 'package:ai_try_on/features/product_detail/domain/repositories/product_detail_repository.dart';

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  final ProductDetailRemoteDataSource _remote;
  ProductDetailRepositoryImpl(this._remote);

  AppException _mapError(Object e) {
    if (e is DioException && e.error is AppException) return e.error as AppException;
    if (e is AppException) return e;
    return const UnknownException();
  }

  @override
  Future<Either<Failure, Product>> getProductDetail(int id) async {
    try {
      final product = await _remote.getProductDetail(id);
      return Right(product);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }
}
