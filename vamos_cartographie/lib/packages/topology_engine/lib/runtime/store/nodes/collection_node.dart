import 'package:topology_engine/runtime/observables/observable_node.dart';

class CollectionNode<T> {
  final ObservableNode _observer;
  CollectionNode(this._observer);
  void notify() {
    _observer.notify();
  }
}
