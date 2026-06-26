import 'package:ai_try_on/core/network/api_endpoints.dart';
import 'package:ai_try_on/core/network/dio_client.dart';
import 'package:ai_try_on/features/notifications/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> listNotifications();
  Future<int> getUnreadCount();
  Future<void> markRead(int id);
  Future<void> markAllRead();
  Future<void> registerDeviceToken({
    required String token,
    required String platform,
  });
  Future<void> removeDeviceToken(String token);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final DioClient _client;
  NotificationRemoteDataSourceImpl(this._client);

  @override
  Future<List<NotificationModel>> listNotifications() async {
    final response = await _client.dio.get(ApiEndpoints.notifications);
    final List results = response.data['results'] as List;
    return results
        .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<int> getUnreadCount() async {
    final response =
        await _client.dio.get(ApiEndpoints.notificationsUnreadCount);
    final count = response.data['data']?['count'] ?? response.data['count'] ?? 0;
    return count as int;
  }

  @override
  Future<void> markRead(int id) async {
    await _client.dio.post(ApiEndpoints.notificationRead(id));
  }

  @override
  Future<void> markAllRead() async {
    await _client.dio.post(ApiEndpoints.notificationsReadAll);
  }

  @override
  Future<void> registerDeviceToken({
    required String token,
    required String platform,
  }) async {
    await _client.dio.post(
      ApiEndpoints.deviceToken,
      data: {'token': token, 'platform': platform},
    );
  }

  @override
  Future<void> removeDeviceToken(String token) async {
    await _client.dio.delete(
      ApiEndpoints.deviceToken,
      data: {'token': token},
    );
  }
}
