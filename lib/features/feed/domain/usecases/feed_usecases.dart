import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/feed/domain/repositories/feed_repository.dart';

class GetFeedUseCase {
  final FeedRepository _repository;
  GetFeedUseCase(this._repository);

  Future<Either<Failure, List<Product>>> call(int page) =>
      _repository.getFeed(page);
}

class LikeProductUseCase {
  final FeedRepository _repository;
  LikeProductUseCase(this._repository);

  Future<Either<Failure, void>> call(int productId) =>
      _repository.likeProduct(productId);
}

class SaveProductUseCase {
  final FeedRepository _repository;
  SaveProductUseCase(this._repository);

  Future<Either<Failure, void>> call(int productId) =>
      _repository.saveProduct(productId);
}

class RefreshFeedUseCase {
  final FeedRepository _repository;
  RefreshFeedUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.refreshFeed();
}
