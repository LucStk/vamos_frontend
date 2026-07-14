mixin Observable {
  final List<void Function()> _listeners = [];

  void addListener(void Function() listener) => _listeners.add(listener);

  void removeListener(void Function() listener) => _listeners.remove(listener);

  void notify() {
    for (final l in List.of(_listeners)) l();
  }
}
