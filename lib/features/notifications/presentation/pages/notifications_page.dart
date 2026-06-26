import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ai_try_on/core/di/injection.dart';
import 'package:ai_try_on/features/notifications/domain/entities/app_notification.dart';
import 'package:ai_try_on/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:ai_try_on/features/notifications/presentation/bloc/notification_event.dart';
import 'package:ai_try_on/features/notifications/presentation/bloc/notification_state.dart';
import 'package:ai_try_on/shared/theme/theme.dart';
import 'package:ai_try_on/shared/widgets/app_empty_widget.dart';
import 'package:ai_try_on/shared/widgets/app_error_widget.dart';
import 'package:ai_try_on/shared/widgets/app_loading_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<NotificationBloc>()..add(const NotificationEvent.fetch()),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirimler', style: context.appTextTheme.headlineSmall),
        actions: [
          BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              final hasUnread = state.maybeWhen(
                loaded: (notifications, unreadCount) => unreadCount > 0,
                orElse: () => false,
              );
              if (!hasUnread) return const SizedBox.shrink();
              return TextButton(
                onPressed: () => context
                    .read<NotificationBloc>()
                    .add(const NotificationEvent.markAllRead()),
                child: Text(
                  'Tümünü Oku',
                  style: context.appTextTheme.labelMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const AppLoadingWidget(),
          error: (message) => AppErrorWidget(
            message: message,
            onRetry: () => context
                .read<NotificationBloc>()
                .add(const NotificationEvent.fetch()),
          ),
          loaded: (notifications, unreadCount) =>
              _NotificationList(notifications: notifications),
        ),
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  final List<AppNotification> notifications;
  const _NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const AppEmptyWidget(
        title: 'Bildirim yok',
        message: 'Henüz bir bildiriminiz bulunmuyor.',
      );
    }

    return ListView.separated(
      padding: AppPadding.p16,
      itemCount: notifications.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.space8),
      itemBuilder: (context, index) =>
          _NotificationItem(notification: notifications[index]),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final AppNotification notification;
  const _NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final isUnread = !notification.isRead;

    return GestureDetector(
      onTap: isUnread
          ? () => context
              .read<NotificationBloc>()
              .add(NotificationEvent.markRead(notification.id))
          : null,
      child: Container(
        padding: AppPadding.p16,
        decoration: BoxDecoration(
          color: isUnread
              ? cs.primary.withValues(alpha: 0.1)
              : cs.surfaceContainerLowest,
          borderRadius: AppRadius.circular12,
          border: Border.all(
            color: isUnread
                ? cs.primary.withValues(alpha: 0.2)
                : cs.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.space8),
              decoration: BoxDecoration(
                color: isUnread
                    ? cs.primary.withValues(alpha: 0.15)
                    : cs.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: PhosphorIcon(
                PhosphorIcons.bell(
                  isUnread ? PhosphorIconsStyle.fill : PhosphorIconsStyle.regular,
                ),
                size: AppSizes.iconMedium,
                color: isUnread ? cs.primary : cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: AppSizes.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: context.appTextTheme.titleSmall?.copyWith(
                            fontWeight:
                                isUnread ? FontWeight.w700 : FontWeight.w500,
                            color: cs.onSurface,
                          ),
                        ),
                      ),
                      if (isUnread)
                        Container(
                          width: AppSizes.space8,
                          height: AppSizes.space8,
                          decoration: BoxDecoration(
                            color: cs.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.space4),
                  Text(
                    notification.body,
                    style: context.appTextTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSizes.space4),
                  Text(
                    _formatDate(notification.createdAt),
                    style: context.appTextTheme.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.parse(isoDate).toLocal();
      final now = DateTime.now();
      final diff = now.difference(dt);

      if (diff.inMinutes < 1) return 'Az önce';
      if (diff.inMinutes < 60) return '${diff.inMinutes} dk önce';
      if (diff.inHours < 24) return '${diff.inHours} sa önce';
      if (diff.inDays < 7) return '${diff.inDays} gün önce';

      return '${dt.day}.${dt.month.toString().padLeft(2, '0')}.${dt.year}';
    } catch (_) {
      return isoDate;
    }
  }
}
