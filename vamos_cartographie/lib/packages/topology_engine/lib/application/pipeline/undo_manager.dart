class UndoAction<T> {
  final int id;
  final T before;
  final T after;

  UndoAction({required this.id, required this.before, required this.after});
}

class UndoManager {
  final Map<int, List<UndoAction>> _stack = {};

  void record<T>(int txId, UndoAction<T> action) {
    (_stack[txId] ??= []).add(action);
  }

  List<UndoAction<T>> pop<T>(int txId) {
    final actions = _stack[txId] ?? [];
    _stack.remove(txId);
    return actions.cast<UndoAction<T>>();
  }

  bool hasTx(int txId) => _stack.containsKey(txId);
}
