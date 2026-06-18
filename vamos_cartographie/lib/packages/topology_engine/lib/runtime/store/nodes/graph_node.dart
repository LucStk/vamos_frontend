import 'package:flutter/foundation.dart';

class GraphNode<T> extends ChangeNotifier {
  T _value;

  bool deleted = false;
  int revision = 0;

  GraphNode(this._value);

  T get value => _value;

  void update(T Function(T current) mutate) {
    _value = mutate(_value);
    revision++;
    notifyListeners();
  }

  void set(T value) {
    _value = value;
    revision++;
    notifyListeners();
  }

  void markDeleted(bool value) {
    deleted = value;
    revision++;
    notifyListeners();
  }
}
