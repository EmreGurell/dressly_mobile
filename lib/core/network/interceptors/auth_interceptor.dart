import 'package:dio/dio.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/shared/services/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = sl<SecureStorageService>().getCachedToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

