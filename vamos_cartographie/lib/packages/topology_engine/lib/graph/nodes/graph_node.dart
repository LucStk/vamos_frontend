import 'package:domain_core/observable_node.dart';

class GraphNode<T> {
  final ObservableNode observer;
  T _value;

  int revision = 0;

  GraphNode(this._value, this.observer);

  T get value => _value;

  void update(T Function(T current) mutate) {
    _value = mutate(_value);
    revision++;
    observer.notify();
  }

  void set(T value) {
    _value = value;
    revision++;

    observer.notify();
  }
}
