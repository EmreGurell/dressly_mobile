import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/tryon/data/models/tryon_model.dart';

abstract class TryonRemoteDataSource {
  Future<TryonResultModel> tryOn({
    required XFile userPhoto,
    required int productId,
  });
}

class TryonRemoteDataSourceImpl implements TryonRemoteDataSource {
  final DioClient _client;
  TryonRemoteDataSourceImpl(this._client);

  @override
  Future<TryonResultModel> tryOn({
    required XFile userPhoto,
    required int productId,
  }) async {
    final formData = FormData.fromMap({
      'product_id': productId,
      'image': await MultipartFile.fromFile(
        userPhoto.path,
        filename: userPhoto.name,
      ),
    });
    final response = await _client.dio.post(
      ApiEndpoints.tryon,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return TryonResultModel.fromJson(response.data as Map<String, dynamic>);
  }
}
