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
  Object? get error => _current is Patch ? (_current as Patch).error : null;
  bool get isPendingCreation => _lastRemoteValue == null && _current is Patch;
  T? get serverValue => _lastRemoteValue;

  /// applique un patch local (optimistic update)
  void patch(T patchValue) {
    assert(patchValue is Patch, 'patchValue doit implémenter Patch<T>');
    _current = patchValue;
    revision++;
  }

  /// reçoit une valeur confirmée par le serveur
  void confirm(T remoteValue) {
    _current = remoteValue;
    _lastRemoteValue = remoteValue;
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
