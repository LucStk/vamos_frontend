import 'dart:async';

import 'package:map_engine/controller/domain/domain.dart';

class PendingTapTimer {
  PendingTapTimer({
    this.timeout = const Duration(milliseconds: 300),
    required this.onTimeout,
  });

  final Duration timeout;
  final void Function() onTimeout;

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
      _timer = null;
      _pendingTap = null;
      onTimeout();
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
