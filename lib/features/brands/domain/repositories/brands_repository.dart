import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/brands/domain/entities/brands.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

abstract class BrandsRepository {
  Future<Either<Failure, List<Brand>>> getBrands();
  Future<Either<Failure, List<Product>>> getBrandProducts(
    int brandId,
    int page, {
    String? category,
  });
}
