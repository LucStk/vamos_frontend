import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

typedef EntityMap<T> = Map<int, T>;

class OptimisticGraphStore {
  // ---------------------------------------------------------------------------
  // STATE
  // ---------------------------------------------------------------------------

  final Map<int, dynamic> _entities = {}; // global store (all types)
  final Map<Type, Map<int, int>> _tempIdMapByType = {};

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
  // CORE ACCESS
  // ---------------------------------------------------------------------------

  Map<int, T> getAll<T>() {
    final result = <int, T>{};

    _entities.forEach((key, value) {
      if (value is T) {
        result[key] = value;
      }
    });

    return result;
  }

  T? get<T>(int id) {
    final resolvedId = resolveId<T>(id);
    final value = _entities[resolvedId];

    if (value is T) return value;
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
  // MUTATIONS
  // ---------------------------------------------------------------------------

  void upsert<T extends HasId>(T entity) {
    _entities[entity.id] = entity;
  }

  void update<T extends HasId>(T entity) {
    if (!_entities.containsKey(entity.id)) {
      throw StateError('Cannot update missing entity ${entity.id}');
    }
    _entities[entity.id] = entity;
  }

  void remove<T>(int id) {
    final resolvedId = resolveId<T>(id);
    _entities.remove(resolvedId);
  }

  // ---------------------------------------------------------------------------
  // RELATION HELPERS (WAYPOINT ↔ VERTEX USE CASE)
  // ---------------------------------------------------------------------------

  Vertex? getVertexByWaypoint(Waypoint wp) {
    final id = resolveId<Vertex>(wp.vertexId);
    final value = _entities[id];

    if (value is Vertex) return value;
    return null;
  }

  Waypoint? getWaypointByVertexId(int vertexId) {
    final resolved = resolveId<Vertex>(vertexId);

    for (final value in _entities.values) {
      if (value is Waypoint && value.vertexId == resolved) {
        return value;
      }
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // BULK OPERATIONS (OPTIMISTIC TRANSACTIONS)
  // ---------------------------------------------------------------------------

  void apply(void Function() fn) {
    fn();
  }

  void rollback(void Function() fn) {
    fn();
  }

  // ---------------------------------------------------------------------------
  // SPECIAL HELPERS FOR YOUR CASE
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
  // RECONCILIATION HELPERS
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
      // ignore: avoid_print
      print('$k -> $v');
    });
  }
}
