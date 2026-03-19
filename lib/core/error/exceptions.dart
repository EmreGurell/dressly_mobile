import 'package:ai_try_on/core/error/failures.dart';

abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);

  Failure toFailure();

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Network error']);

  @override
  Failure toFailure() => Failure.network(message: message);
}

class ServerException extends AppException {
  const ServerException([super.message = 'Server error']);

  @override
  Failure toFailure() => Failure.server(message: message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Unauthorized']);

  @override
  Failure toFailure() => const Failure.unauthorized();
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Not found']);

  @override
  Failure toFailure() => const Failure.notFound();
}

class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timed out']);

  @override
  Failure toFailure() => const Failure.timeout();
}

class NoInternetException extends AppException {
  const NoInternetException([super.message = 'No internet connection']);

  @override
  Failure toFailure() => const Failure.noInternet();
}

class BadRequestException extends AppException {
  final dynamic data;
  const BadRequestException([super.message = 'Bad request', this.data]);

  @override
  Failure toFailure() => Failure.server(message: message);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache error']);

  @override
  Failure toFailure() => Failure.cache(message: message);
}

class UnknownException extends AppException {
  const UnknownException([super.message = 'Unknown error']);

  @override
  Failure toFailure() => const Failure.unknown();
}

class AuthException extends AppException {
  const AuthException([super.message = 'Authentication error']);

  @override
  Failure toFailure() => Failure.unauthorized(message: message);
}

