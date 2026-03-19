import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ai_try_on/core/constants/app_constants.dart';
import 'package:ai_try_on/core/network/interceptors/auth_interceptor.dart';
import 'package:ai_try_on/core/network/interceptors/error_interceptor.dart';
import 'package:ai_try_on/core/network/interceptors/logging_interceptor.dart';
import 'package:ai_try_on/core/network/interceptors/refresh_interceptor.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.addAll([
      if (kDebugMode) LoggingInterceptor(),
      AuthInterceptor(),
      RefreshInterceptor(_dio),
      ErrorInterceptor(),
    ]);
  }

  Dio get dio => _dio;
}

