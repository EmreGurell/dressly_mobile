import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/notifications/domain/entities/app_notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<AppNotification>>> listNotifications();
  Future<Either<Failure, int>> getUnreadCount();
  Future<Either<Failure, void>> markRead(int id);
  Future<Either<Failure, void>> markAllRead();
  Future<Either<Failure, void>> registerDeviceToken({
    required String token,
    required String platform,
  });
  Future<Either<Failure, void>> removeDeviceToken(String token);
}
