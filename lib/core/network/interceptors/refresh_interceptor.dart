import 'package:dio/dio.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/shared/services/auth_service.dart';
import 'package:ai_try_on/shared/services/secure_storage_service.dart';

class RefreshInterceptor extends Interceptor {
  final Dio _dio;
  RefreshInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != ApiEndpoints.refresh) {
      try {
        await sl<AuthService>().refreshToken();
        final token = sl<SecureStorageService>().getCachedToken();
        err.requestOptions.headers['Authorization'] = 'Bearer $token';
        final response = await _dio.fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (_) {
        await sl<AuthService>().logout();
      }
    }
    handler.next(err);
  }
}

