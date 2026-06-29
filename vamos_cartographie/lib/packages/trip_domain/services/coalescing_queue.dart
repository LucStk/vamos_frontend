import 'dart:async';

typedef RemoteOperation<T> = Future<void> Function(T value);

class CoalescingQueue<K, T> {
  final Map<K, _QueueEntry<T>> _entries = {};

  Future<void> schedule(K key, T value, RemoteOperation<T> operation) async {
    final entry = _entries.putIfAbsent(key, () => _QueueEntry<T>());

    entry.pending = value;

    if (entry.running) {
      return;
    }

    entry.running = true;

    try {
      while (entry.pending != null) {
        final nextValue = entry.pending!;
        entry.pending = null;

        await operation(nextValue);
      }
    } finally {
      entry.running = false;

      if (entry.pending == null) {
        _entries.remove(key);
      }
    }
  }

  bool isRunning(K key) {
    return _entries[key]?.running ?? false;
  }

  bool hasPending(K key) {
    return _entries[key]?.pending != null;
  }

  void clear(K key) {
    _entries.remove(key);
  }

  void clearAll() {
    _entries.clear();
  }
}

class _QueueEntry<T> {
  bool running = false;
  T? pending;
}
