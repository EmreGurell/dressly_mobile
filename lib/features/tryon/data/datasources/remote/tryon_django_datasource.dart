import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/tryon/data/datasources/remote/tryon_remote_datasource.dart';
import 'package:ai_try_on/features/tryon/data/models/tryon_model.dart';

class DjangoTryonDataSourceImpl implements TryonRemoteDataSource {
  final DioClient _client;
  DjangoTryonDataSourceImpl(this._client);

  @override
  Future<TryonResultModel> createTryOn({
    required int productId,
    required XFile userPhoto,
  }) async {
    final formData = FormData.fromMap({
      'product_id': productId,
      'user_photo': await MultipartFile.fromFile(
        userPhoto.path,
        filename: 'photo.jpg',
        contentType: DioMediaType('image', 'jpeg'),
      ),
    });
    final response = await _client.dio.post(
      ApiEndpoints.tryonCreate,
      data: formData,
    );
    return TryonResultModel.fromJson(response.data['data']);
  }

  @override
  Future<TryonResultModel> getTryOnStatus(int tryonId) async {
    final response = await _client.dio.get(ApiEndpoints.tryonStatus(tryonId));
    return TryonResultModel.fromJson(response.data['data']);
  }

  @override
  Future<List<TryonResultModel>> listTryOns() async {
    final response = await _client.dio.get(ApiEndpoints.tryon);
    final raw = response.data;
    final List results = raw is List
        ? raw
        : (raw['data'] as List? ?? raw['results'] as List? ?? []);
    return results.map((e) => TryonResultModel.fromJson(e)).toList();
  }
}
