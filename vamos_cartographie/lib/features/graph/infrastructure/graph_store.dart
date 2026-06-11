import 'package:flutter/rendering.dart';
import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/features/graph/domain/entity_state.dart';

typedef EntityMap<T> = Map<int, T>;

class GraphStore {
  /// global store: Type -> entityId -> EntityState<dynamic>
  final Map<Type, Map<int, EntityState<dynamic>>> _entities = {};
  int _tempId = -1;

  int nextTempId() => _tempId--;

  Map<int, EntityState<T>> getEntityMap<T>() {
    final sourceMap = _entities[T];
    if (sourceMap == null) {
      throw Exception("GraphStore Exception, $T not in _entities");
    }
    return sourceMap.cast<int, EntityState<T>>();
  }

  T? get<T>(int id) => getEntityMap<T>()[id]?.value;
  EntityState<T>? getState<T>(int id) => getEntityMap<T>()[id];

  T getOrThrow<T>(int id) {
    final entity = get<T>(id);
    if (entity == null) {
      throw StateError('$T $id not found in GraphStore');
    }
    return entity;
  }

  bool isRevisionCurrent<T>(int id, int revision) =>
      this.revision<T>(id) == revision;

  int revision<T>(int id) {
    final t = getEntityMap<T>()[id];
    return (t != null) ? t.revision : 0;
  }

  DateTime? updatedAt<T>(int id) {
    final t = getEntityMap<T>()[id];
    return (t != null) ? t.updatedAt : null;
  }

  void upsert<T extends HasId>(T entity) {
    final existing = getState<T>(entity.id);
    if (existing != null) {
      // On inject la nouvelle entity
      getEntityMap<T>()[entity.id] = existing.copyWith(value: entity);
    } else {
      getEntityMap<T>()[entity.id] = EntityState<T>(value: entity);
    }
  }

  void update<T extends HasId>(T entity) {
    if (!getEntityMap<T>().containsKey(entity.id)) {
      throw StateError('Cannot update missing entity ${entity.id}');
    }
    upsert<T>(entity);
  }

  void remove<T>(int id) => getEntityMap<T>().remove(id);

  void apply(void Function() fn) => fn();
  void rollback(void Function() fn) => fn();

  void debugPrintState() {
    // ignore: avoid_print
    print('--- GRAPH STATE ---');

    _entities.forEach((key, val) {
      val.forEach((k, v) {
        debugPrint('$k -> ${v.value} (rev: ${v.revision})');
      });
    });
  }
}
