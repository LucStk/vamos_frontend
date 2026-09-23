enum NotificationType { success, error }

class AppNotification {
  final String message;
  final NotificationType type;
  final Duration duration;

  AppNotification({
    required this.message,
    required this.type,
    this.duration = const Duration(seconds: 3),
  });
}
