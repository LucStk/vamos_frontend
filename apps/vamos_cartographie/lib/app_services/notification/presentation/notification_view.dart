import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/notification_provider.dart';
import 'notification_card.dart';
import 'package:vamos_cartographie/ui_kit/theme/theme.dart';

class NotificationListenerWidget extends StatelessWidget {
  const NotificationListenerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: NotificationOverlay(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationOverlay extends ConsumerWidget {
  const NotificationOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notification = ref.watch(notificationQueueProvider);
    if (notification == null) {
      return SizedBox.shrink();
    }

    final isSuccess = notification.type == NotificationType.success;
    if (isSuccess) {
      final colors = AppColors.of(context);
      return NotificationCard(
        backgroundColor: colors.successContainer,
        icon: Icons.check_circle_rounded,
        iconColor: colors.success,
        message: notification.message,
      );
    }
    final scheme = Theme.of(context).colorScheme;
    return NotificationCard(
      backgroundColor: scheme.errorContainer,
      icon: Icons.error_rounded,
      iconColor: scheme.error,
      message: notification.message,
    );
  }
}
