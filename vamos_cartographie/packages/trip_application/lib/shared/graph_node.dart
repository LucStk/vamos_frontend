import 'graph_node_state.dart';

import 'package:domain_core/domain_core.dart';

class GraphNode<T extends Patchable<T>> implements HasId {
  NodeState<T> _state;
  int revision = 0;

  GraphNode(this._state);

  NodeState<T> get current => _state;

  // Nécessaire pour que GraphNode<T> soit utilisable comme V dans CollectionStore
  @override
  Id<T> get id => _state.id;

  void set(Patch<T> patchValue) {
    _state = NodeState.hasPatch(
      patch: patchValue,
      originalValue: _state.serverValue,
    );
    revision++;
  }

  void commit(T? serverValue) {
    if (serverValue != null) {
      _state = HasValue(serverValue);
      revision++;
    }
    if (_state case HasPatch(patch: final p)) {
      final newValue = p.toEntity();
      _state = HasValue(newValue);
      revision++;
    }
  }

  void rollback() {
    if (_state case HasPatch(originalValue: final original)) {
      if (original != null) {
        _state = HasValue(original);
      }
      revision++;
    }
  }
}
