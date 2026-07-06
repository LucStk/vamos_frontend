import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/notification_provider.dart';

class NotificationCard extends ConsumerWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final String message;
  const NotificationCard({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(notificationQueueProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor, size: 28),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: notifier.dismissCurrent,
                  icon: Icon(Icons.close, color: iconColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
