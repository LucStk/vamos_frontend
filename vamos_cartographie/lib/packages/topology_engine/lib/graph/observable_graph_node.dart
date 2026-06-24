import 'package:domain_core/observable.dart';

class ObservableGraphNode<T> with Observable {
  T value;
  int revision = 0;
  ObservableGraphNode(this.value);

  void set(T value) {
    value = value;
    revision++;
    notify();
  }
}
