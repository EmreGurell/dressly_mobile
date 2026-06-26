import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/product_detail/domain/repositories/product_detail_repository.dart';

class GetProductDetailUseCase {
  final ProductDetailRepository _repository;
  GetProductDetailUseCase(this._repository);

  Future<Either<Failure, Product>> call(int id) => _repository.getProductDetail(id);
}
