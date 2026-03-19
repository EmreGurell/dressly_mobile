import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/tryon/domain/entities/tryon.dart';

abstract class TryonRepository {
  Future<Either<Failure, TryonResult>> tryOn({
    required XFile userPhoto,
    required int productId,
  });
}
