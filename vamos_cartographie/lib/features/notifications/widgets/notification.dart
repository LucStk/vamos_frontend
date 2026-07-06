import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/notification_provider.dart';

class NotificationListenerWidget extends ConsumerStatefulWidget {
  const NotificationListenerWidget({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<NotificationListenerWidget> createState() =>
      _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState
    extends ConsumerState<NotificationListenerWidget> {
  final OverlayPortalController _controller = OverlayPortalController();

  AppNotification? _notification;

  @override
  Widget build(BuildContext context) {
    ref.listen<AppNotification?>(notificationQueueProvider, (previous, next) {
      if (next == null) {
        _controller.hide();
      } else {
        _notification = next;
        _controller.show();
      }
    });

    return OverlayPortal(
      controller: _controller,
      overlayChildBuilder: (context) {
        final notification = _notification;

        if (notification == null) {
          return const SizedBox.shrink();
        }

        final isSuccess = notification.type == NotificationType.success;

        final backgroundColor = isSuccess
            ? const Color(0xFFE8F5E9)
            : const Color(0xFFFFEBEE);

        final iconColor = isSuccess
            ? const Color(0xFF2E7D32)
            : const Color(0xFFC62828);

        final icon = isSuccess
            ? Icons.check_circle_rounded
            : Icons.error_rounded;

        return SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                color: Colors.transparent,
                child: AnimatedSlide(
                  offset: Offset.zero,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 12,
                          offset: Offset(0, 4),
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(icon, color: iconColor, size: 28),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            notification.message,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: iconColor),
                          onPressed: () => _dismiss(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: widget.child,
    );
  }

  void _dismiss() {
    _controller.hide();
    _notification = null;
    ref.read(notificationQueueProvider.notifier).dismissCurrent();
  }
}
