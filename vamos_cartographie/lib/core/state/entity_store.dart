import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntityStore<T> {
  final Map<int, T> value;

  const EntityStore(this.value);

  EntityStore<T> copyWith(Map<int, T> newValue) {
    return EntityStore<T>(newValue);
  }

  static Map<int, T> empty<T>() => <int, T>{};
}
