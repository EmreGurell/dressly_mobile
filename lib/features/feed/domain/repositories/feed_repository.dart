import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

abstract class FeedRepository {
  Future<Either<Failure, List<Product>>> getFeed(int page);
  Future<Either<Failure, void>> likeProduct(int productId);
  Future<Either<Failure, void>> saveProduct(int productId);
  Future<Either<Failure, void>> refreshFeed();
}
