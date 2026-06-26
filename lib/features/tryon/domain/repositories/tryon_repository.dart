import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';

abstract class TryonRepository {
  Future<Either<Failure, TryonResult>> createTryOn({
    required int productId,
    required XFile userPhoto,
  });

  Future<Either<Failure, TryonResult>> getTryOnStatus(int tryonId);

  Future<Either<Failure, List<TryonResult>>> listTryOns();
}
