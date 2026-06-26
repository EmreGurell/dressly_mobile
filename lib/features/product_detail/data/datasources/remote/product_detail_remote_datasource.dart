import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/feed/domain/entities/product.dart';

abstract class ProductDetailRemoteDataSource {
  Future<Product> getProductDetail(int id);
}

class ProductDetailRemoteDataSourceImpl implements ProductDetailRemoteDataSource {
  final DioClient _client;
  ProductDetailRemoteDataSourceImpl(this._client);

  @override
  Future<Product> getProductDetail(int id) async {
    final response = await _client.dio.get(ApiEndpoints.productDetail(id));
    final json = response.data as Map<String, dynamic>;
    final brand = json['brand'] as Map<String, dynamic>? ?? {};
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      brandName: (brand['name'] as String?) ?? '',
      price: double.parse(json['price'].toString()),
      imageUrl: (json['image_url'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      brandLogoUrl: (brand['logo_url'] as String?) ?? '',
      likeCount: (json['like_count'] as int?) ?? 0,
      saveCount: (json['save_count'] as int?) ?? 0,
      isLiked: (json['is_liked'] as bool?) ?? false,
      isSaved: (json['is_saved'] as bool?) ?? false,
      productUrl: (json['product_url'] as String?) ?? '',
    );
  }
}
