import 'dart:async';
import '/domain/domain.dart';

class PendingTapTimer {
  PendingTapTimer({
    this.timeout = const Duration(milliseconds: 300),
    required this.onTimeout,
  });

  final Duration timeout;
  final void Function(PendingTap pendingTap) onTimeout;

  Timer? _timer;
  PendingTap? _pendingTap;

  void update(PendingTap? pendingTap) {
    if (pendingTap == null) {
      cancel();
      return;
    }

    if (identical(_pendingTap, pendingTap)) {
      return;
    }

    _pendingTap = pendingTap;

    _timer?.cancel();
    _timer = Timer(timeout, () {
      final tap = _pendingTap;
      _timer = null;
      _pendingTap = null;
      if (tap != null) onTimeout(tap);
    });
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
    _pendingTap = null;
  }

  void dispose() {
    cancel();
  }
}
