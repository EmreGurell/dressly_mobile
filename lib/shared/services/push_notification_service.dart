import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ai_try_on/core/router/app_router.dart';
import 'package:ai_try_on/core/router/app_routes.dart';
import 'package:ai_try_on/features/notifications/domain/usecases/notification_usecases.dart';

const _channelId = 'dressly_high';
const _channelName = 'Dressly Bildirimler';

class PushNotificationService {
  final _messaging = FirebaseMessaging.instance;
  final _localPlugin = FlutterLocalNotificationsPlugin();
  String? _currentToken;

  Future<void> initialize() async {
    await _messaging.requestPermission(alert: true, badge: true, sound: true);

    await _localPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
          _channelId,
          _channelName,
          importance: Importance.high,
        ));

    await _localPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          _handleData(jsonDecode(details.payload!) as Map<String, dynamic>);
        }
      },
    );

    FirebaseMessaging.onMessage.listen(_showLocal);
    FirebaseMessaging.onMessageOpenedApp.listen((m) => _handleData(m.data));

    final initial = await _messaging.getInitialMessage();
    if (initial != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _handleData(initial.data));
    }
  }

  Future<void> registerToken(RegisterDeviceTokenUseCase useCase) async {
    final token = await _messaging.getToken();
    if (token == null || token == _currentToken) return;
    _currentToken = token;
    final platform = Platform.isIOS ? 'ios' : 'android';
    await useCase(token: token, platform: platform);

    _messaging.onTokenRefresh.listen((newToken) async {
      if (newToken == _currentToken) return;
      _currentToken = newToken;
      await useCase(token: newToken, platform: platform);
    });
  }

  Future<void> removeToken(RemoveDeviceTokenUseCase useCase) async {
    if (_currentToken == null) return;
    await useCase(_currentToken!);
    _currentToken = null;
  }

  void _showLocal(RemoteMessage message) {
    final n = message.notification;
    if (n == null) return;
    _localPlugin.show(
      message.hashCode,
      n.title,
      n.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      payload: jsonEncode(message.data),
    );
  }

  void _handleData(Map<String, dynamic> data) {
    final screen = data['screen'];
    if (screen == 'tryon_result') {
      appRouter.push(AppRoutes.tryonHistory);
    }
  }
}
