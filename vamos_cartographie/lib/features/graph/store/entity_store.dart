import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/core/type/id.dart';

/// Reactive entity store based on per-entity ValueNotifier.
/// This enables fine-grained updates (only affected entities rebuild).
mixin EntityStore<T extends HasId<T>> {
  /// MUST be implemented by the concrete store:
  Map<Id<T>, ValueNotifier<T>> get state;

  int _tempId = -1;
  int nextTempId() => _tempId--;

  // ─────────────────────────────────────────────
  // READ
  // ─────────────────────────────────────────────

  T? get(Id<T> id) => state[id]?.value;

  T getOrThrow(Id<T> id) {
    final entity = get(id);
    if (entity == null) {
      throw StateError('$T $id not found');
    }
    return entity;
  }

  // ─────────────────────────────────────────────
  // CREATE (local optimistic)
  // ─────────────────────────────────────────────

  Id<T> createLocal(T Function(Id<T> tempId) builder) {
    final id = Id<T>(nextTempId());

    state[id] = ValueNotifier<T>(builder(id));

    return id;
  }

  // ─────────────────────────────────────────────
  // UPDATE (local optimistic)
  // ─────────────────────────────────────────────

  T patchLocal(Id<T> id, T Function(T current) mutate) {
    final node = state[id];

    if (node == null) {
      throw StateError('$T $id not found');
    }

    final old = node.value;
    node.value = mutate(old);

    return old;
  }

  // ─────────────────────────────────────────────
  // DELETE (local optimistic)
  // ─────────────────────────────────────────────

  void removeLocal(Id<T> id) {
    state.remove(id);
  }

  // ─────────────────────────────────────────────
  // COMMIT (server reconciliation)
  // ─────────────────────────────────────────────

  void commitCreate(T entity, Id<T> tempId) {
    state.remove(tempId);
    state[entity.id] = ValueNotifier<T>(entity);
  }

  void commitUpdate(T entity) {
    final node = state[entity.id];

    if (node == null) {
      state[entity.id] = ValueNotifier<T>(entity);
      return;
    }

    node.value = entity;
  }

  void commitDelete(Id<T> id) {
    state.remove(id);
  }

  // ─────────────────────────────────────────────
  // ROLLBACK (error recovery)
  // ─────────────────────────────────────────────

  void rollbackCreate(Id<T> tempId) {
    state.remove(tempId);
  }

  void rollbackUpdate(T previous) {
    final node = state[previous.id];

    if (node == null) {
      state[previous.id] = ValueNotifier<T>(previous);
      return;
    }

    node.value = previous;
  }

  void rollbackDelete(T previous) {
    state[previous.id] = ValueNotifier<T>(previous);
  }
}
