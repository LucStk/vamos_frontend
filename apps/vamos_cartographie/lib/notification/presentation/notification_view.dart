import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/notification/domain/domain.dart';
import 'package:vamos_cartographie/notification/injection/injection.dart';
import 'notification_card.dart';

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
      return NotificationCard(
        backgroundColor: const Color(0xFFE8F5E9),
        icon: Icons.check_circle_rounded,
        iconColor: const Color(0xFF2E7D32),
        message: notification.message,
      );
    }
    return NotificationCard(
      backgroundColor: const Color(0xFFFFEBEE),
      icon: Icons.error_rounded,
      iconColor: const Color(0xFFC62828),
      message: notification.message,
    );
  }
}
