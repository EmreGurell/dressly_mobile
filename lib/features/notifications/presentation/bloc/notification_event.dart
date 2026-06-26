import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.freezed.dart';

@freezed
sealed class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.fetch() = _Fetch;
  const factory NotificationEvent.markRead(int id) = _MarkRead;
  const factory NotificationEvent.markAllRead() = _MarkAllRead;
}
