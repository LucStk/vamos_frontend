import 'package:domain_core/domain_core.dart';

class GraphNode<T extends HasId> implements HasId {
  T _current;
  T? _lastRemoteValue; // dernière valeur confirmée serveur, pour rollback
  int revision = 0;

  GraphNode(T initial)
    : _current = initial,
      _lastRemoteValue = initial is Patch ? null : initial;

  T get current => _current;

  @override
  Id<T> get id => _current.id as Id<T>;

  bool get isRecomputing =>
      _current is Patch ? (_current as Patch).recomputing : false;
  bool get isPendingCreation => _lastRemoteValue == null && _current is Patch;
  T? get serverValue => _lastRemoteValue;

  /// applique un patch local (optimistic update)
  void set(T value) {
    _current = value;
    if (value is! Patch) {
      _lastRemoteValue = value;
    }
    revision++;
  }

  void rollback() {
    if (_current is Patch && _lastRemoteValue != null) {
      _current = _lastRemoteValue!;
      revision++;
    }
  }
}

extension GraphNodeDisplayX<T extends HasId> on GraphNode<T> {
  T get display => current;
}
