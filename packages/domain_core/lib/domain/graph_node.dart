import 'package:domain_core/domain_core.dart';

class GraphNode<T extends HasId> implements HasId {
  NodeState<T> _state;
  int revision = 0;

  GraphNode(this._state);

  NodeState<T> get current => _state;

  // Nécessaire pour que GraphNode<T> soit utilisable comme V dans CollectionStore
  @override
  Id<T> get id => _state.id;

  void patch(Patch<T> patchValue, {T? originalValue}) {
    _state = NodeState.hasPatch(
      patch: patchValue,
      originalValue: originalValue,
    );
    revision++;
  }

  void set(T value) {
    _state = HasValue(value);
    revision++;
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
