import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/shared/services/secure_storage_service.dart';

class AuthService {
  final DioClient _client;
  final SecureStorageService _secureStorage;

  AuthService(this._client, this._secureStorage);

  bool get isAuthenticated =>
      _secureStorage.getCachedToken() != null && _secureStorage.getCachedToken()!.isNotEmpty;

  Future<void> refreshToken() async {
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken == null) throw Exception('No refresh token');

    final response = await _client.dio.post(
      ApiEndpoints.refresh,
      data: {'refresh': refreshToken},
    );

    await _secureStorage.saveToken(response.data['access']);
  }

  Future<void> logout() async {
    await _secureStorage.clearAll();
  }
}

