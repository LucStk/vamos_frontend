import 'dart:async';
import 'dart:collection';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_provider.g.dart';

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

@Riverpod(keepAlive: true)
class NotificationQueue extends _$NotificationQueue {
  final ListQueue<AppNotification> _queue = ListQueue<AppNotification>();

  Timer? _dismissTimer;
  Timer? _nextTimer;

  bool _isDisplaying = false;

  @override
  AppNotification? build() {
    ref.onDispose(() {
      _dismissTimer?.cancel();
      _nextTimer?.cancel();
    });

    return null;
  }

  void show({
    required String message,
    required NotificationType type,
    Duration? duration,
  }) {
    _queue.add(
      AppNotification(
        message: message,
        type: type,
        duration: duration ?? const Duration(seconds: 3),
      ),
    );

    _checkQueue();
  }

  void dismissCurrent() {
    if (!ref.mounted) return;

    _dismissTimer?.cancel();

    state = null;
    _isDisplaying = false;

    _nextTimer?.cancel();
    _nextTimer = Timer(const Duration(milliseconds: 300), _checkQueue);
  }

  void _checkQueue() {
    if (!ref.mounted) return;
    if (_isDisplaying) return;
    if (_queue.isEmpty) return;

    _isDisplaying = true;
    state = _queue.removeFirst();

    _dismissTimer?.cancel();
    _dismissTimer = Timer(state!.duration, () {
      if (!ref.mounted) return;
      if (_isDisplaying) {
        dismissCurrent();
      }
    });
  }

  /// Optionnel : vider complètement la queue
  void clear() {
    _dismissTimer?.cancel();
    _nextTimer?.cancel();

    _queue.clear();
    _isDisplaying = false;
    state = null;
  }
}
