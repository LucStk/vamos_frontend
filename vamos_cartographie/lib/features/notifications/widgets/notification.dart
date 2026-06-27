import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/notification_provider.dart';

class NotificationListenerWidget extends ConsumerWidget {
  final Widget child;

  const NotificationListenerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On écoute le provider. Dès qu'il passe de 'null' à une notification, on l'affiche !
    ref.listen<AppNotification?>(notificationQueueProvider, (previous, next) {
      if (next != null) {
        _showSheet(context, ref, next);
      }
    });

    return child;
  }

  void _showSheet(
    BuildContext context,
    WidgetRef ref,
    AppNotification notification,
  ) {
    final notificationQueue = ref.read(notificationQueueProvider.notifier);
    final isSuccess = notification.type == NotificationType.success;
    final backgroundColor = isSuccess
        ? const Color(0xFFE8F5E9)
        : const Color(0xFFFFEBEE);
    final iconColor = isSuccess
        ? const Color(0xFF2E7D32)
        : const Color(0xFFC62828);
    final icon = isSuccess ? Icons.check_circle_rounded : Icons.error_rounded;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.02), // Très discret
      enableDrag:
          false, // Évite que l'utilisateur casse le flux en scrollant vers le bas
      isDismissible: false, // C'est le notifier qui contrôle la durée de vie
      builder: (ctx) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 28),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    notification.message,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: iconColor.withOpacity(0.5),
                    size: 20,
                  ),
                  onPressed: () {
                    // Ferme visuellement la bottom sheet
                    Navigator.of(ctx).pop();
                    // Informe Riverpod pour qu'il passe à la suite
                    notificationQueue.dismissCurrent();
                  },
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      notificationQueue.dismissCurrent();
    });
  }
}
