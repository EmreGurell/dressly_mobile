import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/feed/data/models/feed_model.dart';

abstract class SavedRemoteDataSource {
  Future<List<ProductModel>> getSaved();
  Future<void> removeSaved(int productId);
}

class SavedRemoteDataSourceImpl implements SavedRemoteDataSource {
  final DioClient _client;
  SavedRemoteDataSourceImpl(this._client);

  @override
  Future<List<ProductModel>> getSaved() async {
    final response = await _client.dio.get(ApiEndpoints.saved);
    final List results = response.data['results'] ?? response.data;
    return results
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> removeSaved(int productId) async {
    await _client.dio.post(
      ApiEndpoints.save,
      data: {'product_id': productId},
    );
  }
}
