import 'package:flutter/foundation.dart';

class GraphNode<T> {
  T _value;

  bool deleted = false;
  int revision = 0;

  final ValueNotifier<int> _vn = ValueNotifier(0);

  GraphNode(this._value);

  T get value => _value;

  ValueListenable<int> get listenable => _vn;

  void update(T Function(T current) mutate) {
    _value = mutate(_value);
    revision++;
    _notify();
  }

  void set(T value) {
    _value = value;
    revision++;
    _notify();
  }

  void markDeleted(bool value) {
    deleted = value;
    revision++;
    _notify();
  }

  void _notify() {
    _vn.value++;
  }
}
