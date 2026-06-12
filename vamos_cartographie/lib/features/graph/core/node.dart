import 'package:flutter/foundation.dart';

class Node<T> {
  T value;
  bool deleted;
  int revision;

  final ValueNotifier<int> _vn = ValueNotifier(0);

  Node(this.value, {this.deleted = false, this.revision = 0});

  void notify() {
    _vn.value++;
  }

  ValueListenable<int> get listenable => _vn;
}
