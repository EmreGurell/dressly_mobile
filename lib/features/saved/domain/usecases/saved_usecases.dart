import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';
import 'package:ai_try_on/features/saved/domain/repositories/saved_repository.dart';

class GetSavedUseCase {
  final SavedRepository _repository;
  GetSavedUseCase(this._repository);

  Future<Either<Failure, List<Product>>> call() => _repository.getSaved();
}

class RemoveSavedUseCase {
  final SavedRepository _repository;
  RemoveSavedUseCase(this._repository);

  Future<Either<Failure, void>> call(int productId) =>
      _repository.removeSaved(productId);
}
