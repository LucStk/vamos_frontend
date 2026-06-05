import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntityStoreHelpers {
  // current state safe read
  static Map<int, T> current<T>(AsyncValue<Map<int, T>> state) {
    return state.value ?? <int, T>{};
  }

  // set one entity
  static Map<int, T> set<T>(Map<int, T> map, int id, T value) {
    final next = Map<int, T>.from(map);
    next[id] = value;
    return next;
  }

  // remove one entity
  static Map<int, T> remove<T>(Map<int, T> map, int id) {
    final next = Map<int, T>.from(map)..remove(id);
    return next;
  }

  // optimistic replace via patch
  static Map<int, T> update<T>(Map<int, T> map, int id, T value) {
    return set(map, id, value);
  }
}
