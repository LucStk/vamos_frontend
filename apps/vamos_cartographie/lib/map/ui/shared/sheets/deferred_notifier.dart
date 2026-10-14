// deferred_notifier.dart
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart';

/// [ValueNotifier] qui diffère la mise à jour si elle survient pendant le layout.
class DeferredNotifier<T> extends ValueNotifier<T> {
  DeferredNotifier(super.value);

  bool _disposed = false;

  void set(T newValue) {
    if (value == newValue) return;

    final inLayout =
        SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks;
    if (!inLayout) {
      value = newValue;
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_disposed) value = newValue;
    });
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
