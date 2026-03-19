import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';
import 'package:ai_try_on/features/tryon/domain/repositories/tryon_repository.dart';

class TryOnUseCase {
  final TryonRepository _repository;
  TryOnUseCase(this._repository);

  Future<Either<Failure, TryonResult>> call({
    required XFile userPhoto,
    required int productId,
  }) =>
      _repository.tryOn(userPhoto: userPhoto, productId: productId);
}
