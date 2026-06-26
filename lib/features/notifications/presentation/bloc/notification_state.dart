import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/notifications/domain/entities/app_notification.dart';

part 'notification_state.freezed.dart';

@freezed
sealed class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.loaded({
    required List<AppNotification> notifications,
    required int unreadCount,
  }) = _Loaded;
  const factory NotificationState.error(String message) = _Error;
}
