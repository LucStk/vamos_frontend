import 'package:trip_application/shared/graph_node_state.dart';

class GraphNode<T extends Patchable<T>> {
  NodeState<T> _state;
  int revision = 0;

  GraphNode(this._state);
  NodeState get current => _state;

  void set(Patch<T> patchValue) {
    _state = NodeState.hasPatch(
      patch: patchValue,
      originalValue: _state.originalValue,
    );
    revision++;
  }

  // 2. Si le commit réussit
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

  // 3. ✨ NOUVEAU : Si le patch échoue, on peut annuler proprement !
  void rollback() {
    if (_state case HasPatch(originalValue: final original)) {
      if (original != null) {
        // On revient à la valeur saine d'origine
        _state = HasValue(original);
      } else {
        // Pas de valeur d'origine (le nœud a été créé directement avec un patch)
        // À toi de voir si tu lances une erreur ou si tu supprimes le nœud du store
      }
      revision++;
    }
  }
}
