final class EffectQueue {
  Future<void> _tail = Future.value();

  void add(Future<void> Function() effect) {
    _tail = _tail.then((_) async {
      try {
        await effect();
      } catch (_) {
        // Log / report si nécessaire.
        // L'erreur ne doit pas interrompre la queue.
      }
    });
  }
}
