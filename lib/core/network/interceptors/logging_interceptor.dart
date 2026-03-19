import 'package:dio/dio.dart';
import 'package:ai_try_on/core/utils/logger/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.d('REQUEST: ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.d('RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.e(
      'ERROR: ${err.response?.statusCode} ${err.requestOptions.uri}\nBody: ${err.response?.data}',
      err.error,
    );
    handler.next(err);
  }
}
