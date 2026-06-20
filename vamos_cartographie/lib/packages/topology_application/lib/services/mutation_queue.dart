import 'dart:async';

class MutationQueue<K> {
  final Map<K, Future<void>> _running = {};

  Future<T> enqueue<T>(K key, Future<T> Function() operation) {
    final previous = _running[key] ?? Future.value();

    final completer = Completer<T>();

    final next = previous.then((_) async {
      try {
        final result = await operation();
        completer.complete(result);
      } catch (e, st) {
        completer.completeError(e, st);
      }
    });

    _running[key] = next.whenComplete(() {
      if (identical(_running[key], next)) {
        _running.remove(key);
      }
    });

    return completer.future;
  }
}
