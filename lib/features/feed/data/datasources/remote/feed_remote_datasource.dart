import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/feed/data/models/feed_model.dart';

abstract class FeedRemoteDataSource {
  Future<List<ProductModel>> getFeed(int page);
  Future<void> likeProduct(int productId);
  Future<void> saveProduct(int productId);
  Future<void> refreshFeed();
  Future<List<ProductModel>> getRecommendations();
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  final DioClient _client;
  FeedRemoteDataSourceImpl(this._client);

  @override
  Future<List<ProductModel>> getFeed(int page) async {
    final response = await _client.dio.get(
      ApiEndpoints.feed,
      queryParameters: {'page': page},
    );
    final List results = response.data['results'];
    return results.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<void> likeProduct(int productId) async {
    await _client.dio.post(ApiEndpoints.like, data: {'product_id': productId});
  }

  @override
  Future<void> saveProduct(int productId) async {
    await _client.dio.post(ApiEndpoints.save, data: {'product_id': productId});
  }

  @override
  Future<void> refreshFeed() async {
    await _client.dio.post(ApiEndpoints.feedRefresh);
  }

  @override
  Future<List<ProductModel>> getRecommendations() async {
    final response = await _client.dio.get(ApiEndpoints.recommendations);
    final List results = response.data['results'] ?? [];
    return results.map((e) => ProductModel.fromJson(e)).toList();
  }
}
