import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const Failure._();

  const factory Failure.network({required String message}) = NetworkFailure;
  const factory Failure.server({required String message}) = ServerFailure;
  const factory Failure.unauthorized({@Default('Unauthorized') String message}) = UnauthorizedFailure;
  const factory Failure.notFound({@Default('Not found') String message}) = NotFoundFailure;
  const factory Failure.timeout({@Default('Request timed out') String message}) = TimeoutFailure;
  const factory Failure.noInternet({@Default('No internet connection') String message}) = NoInternetFailure;
  const factory Failure.cache({required String message}) = CacheFailure;
  const factory Failure.unknown({@Default('Unknown error') String message}) = UnknownFailure;

  String get message => when(
        network: (msg) => msg,
        server: (msg) => msg,
        unauthorized: (msg) => msg,
        notFound: (msg) => msg,
        timeout: (msg) => msg,
        noInternet: (msg) => msg,
        cache: (msg) => msg,
        unknown: (msg) => msg,
      );
}

