import 'dart:async';
import 'dart:collection';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/notification/domain/domain.dart';

part 'notification_provider.g.dart';

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
    // Diffère pour éviter la modification pendant le build
    Future(_checkQueue);
  }

  void dismissCurrent() {
    if (!ref.mounted) return;

    _dismissTimer?.cancel();

    _isDisplaying = false;

    state = null;

    _nextTimer?.cancel();
    _nextTimer = Timer(const Duration(milliseconds: 300), _checkQueue);
  }

  void _checkQueue() {
    if (!ref.mounted) return;
    if (_isDisplaying) return;
    if (_queue.isEmpty) return;
    _isDisplaying = true;
    final next = _queue.removeFirst();
    // Diffère l'assignation du state
    Future(() {
      if (!ref.mounted) return;
      state = next;
      _dismissTimer?.cancel();
      _dismissTimer = Timer(next.duration, () {
        if (!ref.mounted) return;
        if (_isDisplaying) dismissCurrent();
      });
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
