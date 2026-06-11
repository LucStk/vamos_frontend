import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/has_id.dart';

mixin EntityStore<T extends HasId> {
  AsyncValue<Map<int, T>> get state;
  set state(AsyncValue<Map<int, T>> value);
  Map<int, T> get entities => state.value ?? const {};
  int _tempId = -1;
  int nextTempId() => _tempId--;

  T? get(int id) => entities[id];

  T getOrThrow(int id) {
    final entity = get(id);
    if (entity == null) {
      throw StateError('$T $id not found');
    }
    return entity;
  }

  int createLocal(T Function(int tempId) builder) {
    final id = nextTempId();

    final copy = Map<int, T>.from(entities);

    copy[id] = builder(id);

    state = AsyncData(copy);

    return id;
  }

  T patchLocal(int id, T Function(T current) mutate) {
    final copy = Map<int, T>.from(entities);

    final current = copy[id];

    if (current == null) {
      throw StateError('$T $id not found');
    }

    final old = current;

    copy[id] = mutate(current);

    state = AsyncData(copy);

    return old;
  }

  void removeLocal(int id) {
    final copy = Map<int, T>.from(entities);

    copy.remove(id);

    state = AsyncData(copy);
  }

  void commitCreate(T entity, int tempId) {
    final copy = Map<int, T>.from(entities);

    copy.remove(tempId);
    copy[entity.id] = entity;

    state = AsyncData(copy);
  }

  void commitUpdate(T entity) {
    final copy = Map<int, T>.from(entities);

    copy[entity.id] = entity;

    state = AsyncData(copy);
  }

  void rollbackCreate(int tempId) {
    final copy = Map<int, T>.from(entities);

    copy.remove(tempId);

    state = AsyncData(copy);
  }

  void rollbackUpdate(T previous) {
    final copy = Map<int, T>.from(entities);

    copy[previous.id] = previous;

    state = AsyncData(copy);
  }
}
