import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/features/graph/domain/entity_state.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

typedef EntityMap<T> = Map<int, T>;

/// ---------------------------------------------------------------------------
/// OPTIMISTIC GRAPH STORE
/// ---------------------------------------------------------------------------
class OptimisticGraphStore {
  /// global store: entityId -> EntityState<T>
  final Map<int, dynamic> _entities = {};

  /// tempId -> realId per type
  final Map<Type, Map<int, int>> _tempIdMapByType = {};

  /// optional legacy revision tracking (kept for compatibility)
  final Map<int, int> _revisions = {};

  int _tempId = -1;

  // ---------------------------------------------------------------------------
  // TEMP IDS
  // ---------------------------------------------------------------------------

  int nextTempId() => _tempId--;

  void registerTempId<T>(int tempId, int realId) {
    _tempIdMapByType.putIfAbsent(T, () => {});
    _tempIdMapByType[T]![tempId] = realId;
  }

  int resolveId<T>(int id) {
    final map = _tempIdMapByType[T];
    if (map == null) return id;
    return map[id] ?? id;
  }

  // ---------------------------------------------------------------------------
  // REVISION (legacy helper, still useful)
  // ---------------------------------------------------------------------------

  int nextRevision(int id) {
    final r = (_revisions[id] ?? 0) + 1;
    _revisions[id] = r;
    return r;
  }

  int revision<T>(int id) {
    final resolvedId = resolveId<T>(id);
    final state = _entities[resolvedId];

    if (state is EntityState<T>) {
      return state.revision;
    }

    return 0;
  }

  DateTime? updatedAt<T>(int id) {
    final resolvedId = resolveId<T>(id);
    final state = _entities[resolvedId];

    if (state is EntityState<T>) {
      return state.updatedAt;
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // CORE ACCESS
  // ---------------------------------------------------------------------------

  Map<int, T> getAll<T>() {
    final result = <int, T>{};

    _entities.forEach((key, value) {
      if (value is EntityState<T>) {
        result[key] = value.value;
      }
    });

    return result;
  }

  T? get<T>(int id) {
    final resolvedId = resolveId<T>(id);
    final state = _entities[resolvedId];

    if (state is EntityState<T>) {
      return state.value;
    }

    return null;
  }

  T getOrThrow<T>(int id) {
    final entity = get<T>(id);

    if (entity == null) {
      throw StateError('$T $id not found in GraphStore');
    }

    return entity;
  }

  // ---------------------------------------------------------------------------
  // UPSERT / UPDATE
  // ---------------------------------------------------------------------------

  void upsert<T extends HasId>(T entity) {
    final now = DateTime.now();

    final existing = _entities[entity.id];

    final revision = (existing is EntityState<T>) ? existing.revision + 1 : 1;

    _entities[entity.id] = EntityState<T>(
      value: entity,
      revision: revision,
      updatedAt: now,
    );
  }

  void update<T extends HasId>(T entity) {
    if (!_entities.containsKey(entity.id)) {
      throw StateError('Cannot update missing entity ${entity.id}');
    }

    upsert<T>(entity);
  }

  // ---------------------------------------------------------------------------
  // REMOVE
  // ---------------------------------------------------------------------------

  void remove<T>(int id) {
    final resolvedId = resolveId<T>(id);
    _entities.remove(resolvedId);
  }

  // ---------------------------------------------------------------------------
  // RELATIONS (WAYPOINT ↔ VERTEX)
  // ---------------------------------------------------------------------------

  Vertex? getVertexByWaypoint(Waypoint wp) {
    final id = resolveId<Vertex>(wp.vertexId);
    final value = _entities[id];

    if (value is EntityState<Vertex>) {
      return value.value;
    }

    return null;
  }

  Waypoint? getWaypointByVertexId(int vertexId) {
    final resolved = resolveId<Vertex>(vertexId);

    for (final value in _entities.values) {
      if (value is EntityState<Waypoint>) {
        if (value.value.vertexId == resolved) {
          return value.value;
        }
      }
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // BULK OPS (optimistic transactions placeholder)
  // ---------------------------------------------------------------------------

  void apply(void Function() fn) => fn();
  void rollback(void Function() fn) => fn();

  bool isRevisionCurrent<T>(int id, int revision) {
    return this.revision<T>(id) == revision;
  }
  // ---------------------------------------------------------------------------
  // OPTIMISTIC HELPERS
  // ---------------------------------------------------------------------------

  Vertex upsertVertexOptimistic(Vertex vertex) {
    upsert<Vertex>(vertex);
    return vertex;
  }

  Waypoint upsertWaypointOptimistic(Waypoint waypoint) {
    upsert<Waypoint>(waypoint);
    return waypoint;
  }

  // ---------------------------------------------------------------------------
  // RECONCILIATION
  // ---------------------------------------------------------------------------

  void reconcileVertex({required int tempId, required Vertex realVertex}) {
    _entities.remove(tempId);
    upsert<Vertex>(realVertex);

    registerTempId<Vertex>(tempId, realVertex.id);
  }

  void reconcileWaypoint(Waypoint waypoint) {
    upsert<Waypoint>(waypoint);
  }

  // ---------------------------------------------------------------------------
  // DEBUG
  // ---------------------------------------------------------------------------

  void debugPrintState() {
    // ignore: avoid_print
    print('--- GRAPH STATE ---');

    _entities.forEach((k, v) {
      if (v is EntityState) {
        // ignore: avoid_print
        print('$k -> ${v.value} (rev: ${v.revision})');
      } else {
        // ignore: avoid_print
        print('$k -> $v');
      }
    });
  }
}
