import 'package:flutter/foundation.dart';

class GraphNode<T> {
  T _value;

  bool deleted = false;
  int revision = 0;

  final ValueNotifier<int> _vn = ValueNotifier(0);

  GraphNode(this._value);

  T get value => _value;

  ValueListenable<int> get listenable => _vn;

  void set(T value) {
    _value = value;
    notify();
  }

  void setDeleted(bool v) {
    deleted = v;
    notify();
  }

  void bumpRevision() {
    revision++;
    notify();
  }

  void notify() {
    _vn.value++;
  }

  static GraphNode<T> create<T>(T value) => GraphNode<T>(value);
}
