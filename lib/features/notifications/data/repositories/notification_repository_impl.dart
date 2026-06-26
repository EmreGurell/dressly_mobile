import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ai_try_on/core/error/exceptions.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/notifications/data/datasources/remote/notification_remote_datasource.dart';
import 'package:ai_try_on/features/notifications/data/models/notification_model.dart';
import 'package:ai_try_on/features/notifications/domain/entities/app_notification.dart';
import 'package:ai_try_on/features/notifications/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remote;
  NotificationRepositoryImpl(this._remote);

  AppException _mapError(Object e) {
    if (e is DioException && e.error is AppException) {
      return e.error as AppException;
    }
    if (e is AppException) return e;
    return const UnknownException();
  }

  @override
  Future<Either<Failure, List<AppNotification>>> listNotifications() async {
    try {
      final models = await _remote.listNotifications();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    try {
      final count = await _remote.getUnreadCount();
      return Right(count);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> markRead(int id) async {
    try {
      await _remote.markRead(id);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> markAllRead() async {
    try {
      await _remote.markAllRead();
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> registerDeviceToken({
    required String token,
    required String platform,
  }) async {
    try {
      await _remote.registerDeviceToken(token: token, platform: platform);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeDeviceToken(String token) async {
    try {
      await _remote.removeDeviceToken(token);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e).toFailure());
    }
  }
}
