import "operation_queue.dart";

class OfflineQueue {
  final List<PendingOperation> _queue = [];

  void add(PendingOperation op) {
    _queue.add(op);
  }

  List<PendingOperation> drain() {
    final copy = List<PendingOperation>.from(_queue);
    _queue.clear();
    return copy;
  }

  bool get isEmpty => _queue.isEmpty;
}
