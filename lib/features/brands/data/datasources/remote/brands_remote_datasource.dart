import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/brands/data/models/brands_model.dart';
import 'package:ai_try_on/features/feed/data/models/feed_model.dart';

abstract class BrandsRemoteDataSource {
  Future<List<BrandModel>> getBrands();
  Future<List<ProductModel>> getProducts(int page, {String? search});
  Future<List<ProductModel>> getBrandProducts(
    int brandId,
    int page, {
    String? category,
    String? search,
  });
}

class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  final DioClient _client;
  BrandsRemoteDataSourceImpl(this._client);

  @override
  Future<List<BrandModel>> getBrands() async {
    final response = await _client.dio.get(ApiEndpoints.brands);
    final List results = response.data['results'] ?? response.data as List;
    return results
        .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProducts(int page, {String? search}) async {
    final response = await _client.dio.get(
      ApiEndpoints.products,
      queryParameters: {
        'page': page,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    final List results = response.data['results'] ?? response.data as List;
    return results
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ProductModel>> getBrandProducts(
    int brandId,
    int page, {
    String? category,
    String? search,
  }) async {
    final response = await _client.dio.get(
      ApiEndpoints.brandProducts(brandId),
      queryParameters: {
        'page': page,
        if (category != null) 'category': category,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    final List results = response.data['results'] ?? response.data as List;
    return results
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
