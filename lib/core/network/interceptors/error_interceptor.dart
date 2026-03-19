import 'package:dio/dio.dart';
import 'package:ai_try_on/core/error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout =>
        const TimeoutException(),
      DioExceptionType.badResponse => _handleStatusCode(err.response),
      DioExceptionType.connectionError => const NoInternetException(),
      _ => const UnknownException(),
    };
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        type: err.type,
        response: err.response,
      ),
    );
  }

  AppException _handleStatusCode(Response? response) =>
      switch (response?.statusCode) {
        400 => BadRequestException('Bad request', response?.data),
        401 => const UnauthorizedException(),
        403 => const UnauthorizedException('Forbidden'),
        404 => const NotFoundException(),
        500 => const ServerException(),
        _ => const UnknownException(),
      };
}

