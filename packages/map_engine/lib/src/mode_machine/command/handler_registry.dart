// mode_machine/command/handler_registry.dart
final class HandlerRegistry {
  final _byType = <Type, Object>{};

  HandlerRegistry register<T extends Object>(T handler) {
    _byType[T] = handler;
    return this;
  }

  T of<T>() {
    final h = _byType[T];
    if (h is T) return h;
    throw StateError('Aucun handler enregistré pour $T');
  }
}
