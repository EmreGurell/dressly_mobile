import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';
import 'package:ai_try_on/features/tryon/domain/repositories/tryon_repository.dart';

class CreateTryOnUseCase {
  final TryonRepository _repository;
  CreateTryOnUseCase(this._repository);

  Future<Either<Failure, TryonResult>> call({
    required int productId,
    required XFile userPhoto,
  }) =>
      _repository.createTryOn(productId: productId, userPhoto: userPhoto);
}

class GetTryOnStatusUseCase {
  final TryonRepository _repository;
  GetTryOnStatusUseCase(this._repository);

  Future<Either<Failure, TryonResult>> call(int tryonId) =>
      _repository.getTryOnStatus(tryonId);
}

class ListTryOnsUseCase {
  final TryonRepository _repository;
  ListTryOnsUseCase(this._repository);

  Future<Either<Failure, List<TryonResult>>> call() =>
      _repository.listTryOns();
}
