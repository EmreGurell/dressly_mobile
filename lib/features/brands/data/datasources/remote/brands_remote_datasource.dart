import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/brands/data/models/brands_model.dart';
import 'package:ai_try_on/features/feed/data/models/feed_model.dart';

abstract class BrandsRemoteDataSource {
  Future<List<BrandModel>> getBrands();
  Future<List<ProductModel>> getBrandProducts(
    int brandId,
    int page, {
    String? category,
  });
}

class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  final DioClient _client;
  BrandsRemoteDataSourceImpl(this._client);

  @override
  Future<List<BrandModel>> getBrands() async {
    final response = await _client.dio.get(ApiEndpoints.brands);
    return (response.data as List)
        .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ProductModel>> getBrandProducts(
    int brandId,
    int page, {
    String? category,
  }) async {
    final response = await _client.dio.get(
      ApiEndpoints.brandProducts(brandId),
      queryParameters: {
        'page': page,
        if (category != null) 'category': category,
      },
    );
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
