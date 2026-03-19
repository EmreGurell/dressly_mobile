import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

abstract class SavedRepository {
  Future<Either<Failure, List<Product>>> getSaved();
  Future<Either<Failure, void>> removeSaved(int productId);
}
