import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_try_on/features/notifications/domain/entities/app_notification.dart';
import 'package:ai_try_on/features/notifications/domain/usecases/notification_usecases.dart';
import 'package:ai_try_on/features/notifications/presentation/bloc/notification_event.dart';
import 'package:ai_try_on/features/notifications/presentation/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final ListNotificationsUseCase _listNotifications;
  final GetUnreadCountUseCase _getUnreadCount;
  final MarkReadUseCase _markRead;
  final MarkAllReadUseCase _markAllRead;

  NotificationBloc({
    required ListNotificationsUseCase listNotifications,
    required GetUnreadCountUseCase getUnreadCount,
    required MarkReadUseCase markRead,
    required MarkAllReadUseCase markAllRead,
  })  : _listNotifications = listNotifications,
        _getUnreadCount = getUnreadCount,
        _markRead = markRead,
        _markAllRead = markAllRead,
        super(const NotificationState.initial()) {
    on<NotificationEvent>((event, emit) async {
      await event.when(
        fetch: () => _onFetch(emit),
        markRead: (id) => _onMarkRead(id, emit),
        markAllRead: () => _onMarkAllRead(emit),
      );
    });
  }

  Future<void> _onFetch(Emitter<NotificationState> emit) async {
    emit(const NotificationState.loading());

    final notificationsResult = await _listNotifications();
    final unreadResult = await _getUnreadCount();

    List<AppNotification> notifications = [];
    int unreadCount = 0;

    bool hasFailed = false;
    notificationsResult.fold(
      (failure) {
        emit(NotificationState.error(failure.message));
        hasFailed = true;
      },
      (data) => notifications = data,
    );

    if (hasFailed) return;

    unreadResult.fold(
      (_) => unreadCount = notifications.where((n) => !n.isRead).length,
      (count) => unreadCount = count,
    );

    emit(NotificationState.loaded(
      notifications: notifications,
      unreadCount: unreadCount,
    ));
  }

  Future<void> _onMarkRead(int id, Emitter<NotificationState> emit) async {
    final currentNotifications = state.whenOrNull(
      loaded: (notifications, _) => notifications,
    );
    if (currentNotifications == null) return;

    final result = await _markRead(id);
    result.fold(
      (_) => null,
      (_) {
        final updated = currentNotifications.map((n) {
          return n.id == id ? n.copyWith(isRead: true) : n;
        }).toList();
        emit(NotificationState.loaded(
          notifications: updated,
          unreadCount: updated.where((n) => !n.isRead).length,
        ));
      },
    );
  }

  Future<void> _onMarkAllRead(Emitter<NotificationState> emit) async {
    final currentNotifications = state.whenOrNull(
      loaded: (notifications, _) => notifications,
    );
    if (currentNotifications == null) return;

    final result = await _markAllRead();
    result.fold(
      (failure) => emit(NotificationState.error(failure.message)),
      (_) {
        final updated =
            currentNotifications.map((n) => n.copyWith(isRead: true)).toList();
        emit(NotificationState.loaded(
          notifications: updated,
          unreadCount: 0,
        ));
      },
    );
  }
}
