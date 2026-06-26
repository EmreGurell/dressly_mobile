import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/brands/domain/repositories/brands_repository.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

class GetBrandsUseCase {
  final BrandsRepository _repository;
  GetBrandsUseCase(this._repository);

  Future<Either<Failure, List<Brand>>> call() => _repository.getBrands();
}

class GetProductsUseCase {
  final BrandsRepository _repository;
  GetProductsUseCase(this._repository);

  Future<Either<Failure, List<Product>>> call(int page, {String? search}) =>
      _repository.getProducts(page, search: search);
}

class GetBrandProductsUseCase {
  final BrandsRepository _repository;
  GetBrandProductsUseCase(this._repository);

  Future<Either<Failure, List<Product>>> call(
    int brandId,
    int page, {
    String? category,
    String? search,
  }) =>
      _repository.getBrandProducts(brandId, page, category: category, search: search);
}
