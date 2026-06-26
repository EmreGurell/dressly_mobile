import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_try_on/features/notifications/domain/entities/app_notification.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
sealed class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required String title,
    required String body,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

extension NotificationModelX on NotificationModel {
  AppNotification toEntity() => AppNotification(
        id: id,
        title: title,
        body: body,
        isRead: isRead,
        createdAt: createdAt,
      );
}
