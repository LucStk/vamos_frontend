class MapEffectQueue {
  Future<void> _tail = Future.value();

  void add(Future<void> Function() effect) {
    _tail = _tail.then((_) async {
      try {
        await effect();
      } catch (e, s) {
        // Log / report : la chaîne doit survivre à l'échec d'un effet.
        // FlutterError.reportError(FlutterErrorDetails(exception: e, stack: s));
      }
    });
  }
}
