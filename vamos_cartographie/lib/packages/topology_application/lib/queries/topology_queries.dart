import 'package:domain_core/id.dart';
import 'package:topology_engine/runtime/store/store.dart';

class TopologyQueries {
  final GraphStore store;

  TopologyQueries(this.store);

  Map<Id<T>, T> collection<T>() {
    return store.getAll<T>();
  }

  T? node<T>(Id<T> id) {
    return store.get(id);
  }

  T nodeRequired<T>(Id<T> id) {
    return store.getRequired<T>(id);
  }

  CollectionNode<T> collectionSignal<T>() {
    return store.collectionSignal<T>();
  }

  GraphNode<T> nodeSignal<T>(Id<T> id) {
    return store.requiredNode<T>(id);
  }
}
