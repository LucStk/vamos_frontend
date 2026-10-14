// mode_machine/command/handler_registry.dart
// mode_machine/command/handler_registry.dart
final class HandlerRegistry {
  const HandlerRegistry(this._scope);

  /// Le scope du mode courant (_ExploreScopeImpl, _TripEditScopeImpl...).
  final Object _scope;

  /// Renvoie le scope vu sous le type [H], ou null si le mode courant
  /// ne fournit pas cette capacité.
  H? maybeOf<H extends Object>() {
    final s = _scope;
    return s is H ? s : null;
  }
}
