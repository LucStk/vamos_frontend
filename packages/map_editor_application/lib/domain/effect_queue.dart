class MapEffectQueue {
  Future<void> _tail = Future.value();

  void add(Future<void> Function() effect) {
    _tail = _tail.then((_) => effect());
  }
}
