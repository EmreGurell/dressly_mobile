import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/features/tryon/data/models/tryon_model.dart';

abstract class TryonRemoteDataSource {
  Future<TryonResultModel> createTryOn({
    required int productId,
    required XFile userPhoto,
  });

  Future<TryonResultModel> getTryOnStatus(int tryonId);

  Future<List<TryonResultModel>> listTryOns();
}
