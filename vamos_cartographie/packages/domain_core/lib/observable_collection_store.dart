import 'package:domain_core/has_id.dart';
import 'package:domain_core/id.dart';
import 'package:domain_core/observable.dart';
import '/collection_store.dart';

class ObservableCollectionStore<T extends HasId> extends CollectionStore<T>
    with Observable {
  @override
  void insert(T value) {
    super.insert(value);
    notify();
  }

  @override
  void remove(Id<T> id) {
    super.remove(id);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}
