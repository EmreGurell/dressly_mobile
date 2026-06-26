import 'package:dartz/dartz.dart';
import 'package:ai_try_on/core/error/failures.dart';
import 'package:ai_try_on/features/notifications/domain/entities/app_notification.dart';
import 'package:ai_try_on/features/notifications/domain/repositories/notification_repository.dart';

class ListNotificationsUseCase {
  final NotificationRepository _repository;
  ListNotificationsUseCase(this._repository);

  Future<Either<Failure, List<AppNotification>>> call() =>
      _repository.listNotifications();
}

class GetUnreadCountUseCase {
  final NotificationRepository _repository;
  GetUnreadCountUseCase(this._repository);

  Future<Either<Failure, int>> call() => _repository.getUnreadCount();
}

class MarkReadUseCase {
  final NotificationRepository _repository;
  MarkReadUseCase(this._repository);

  Future<Either<Failure, void>> call(int id) => _repository.markRead(id);
}

class MarkAllReadUseCase {
  final NotificationRepository _repository;
  MarkAllReadUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.markAllRead();
}

class RegisterDeviceTokenUseCase {
  final NotificationRepository _repository;
  RegisterDeviceTokenUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String token,
    required String platform,
  }) =>
      _repository.registerDeviceToken(token: token, platform: platform);
}

class RemoveDeviceTokenUseCase {
  final NotificationRepository _repository;
  RemoveDeviceTokenUseCase(this._repository);

  Future<Either<Failure, void>> call(String token) =>
      _repository.removeDeviceToken(token);
}
