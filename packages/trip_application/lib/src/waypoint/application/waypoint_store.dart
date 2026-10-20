import 'package:domain_core/domain/domain.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';

class WaypointStore {
  final GraphCollectionStore<WaypointFields> waypointStore;

  const WaypointStore({required this.waypointStore});

  const WaypointStore.initial()
    : waypointStore = const GraphCollectionStore<WaypointFields>();

  /// Monte un store à partir de modèles confirmés par le serveur
  /// (chargement d'un trip).
  factory WaypointStore.fromRemote(Iterable<WaypointFields> waypoints) {
    return WaypointStore(waypointStore: _storeOf(waypoints));
  }

  /// Remplace tout l'état local par celui renvoyé par le serveur.
  /// Les waypoints absents de `waypoints` disparaissent du store.
  WaypointStore replacedByServer(Iterable<WaypointFields> waypoints) {
    return copyWith(waypointStore: _storeOf(waypoints));
  }

  static GraphCollectionStore<WaypointFields> _storeOf(
    Iterable<WaypointFields> waypoints,
  ) => waypoints.fold<GraphCollectionStore<WaypointFields>>(
    const GraphCollectionStore<WaypointFields>(),
    (store, waypoint) => store.setNode(waypoint),
  );

  WaypointStore copyWith({
    GraphCollectionStore<WaypointFields>? waypointStore,
  }) {
    return WaypointStore(waypointStore: waypointStore ?? this.waypointStore);
  }
}

// WaypointStoreActions inchangé

extension WaypointStoreActions on WaypointStore {
  WaypointStore insertWaypoint(WaypointFields state) {
    return copyWith(waypointStore: waypointStore.insertState(state));
  }

  WaypointStore removeWaypoint(WaypointId id) {
    // on supprime le vertexId associé
    return copyWith(waypointStore: waypointStore.remove(id));
  }

  WaypointStore setWaypoint(WaypointFields serverWaypoint) {
    return copyWith(waypointStore: waypointStore.setNode(serverWaypoint));
  }

  WaypointStore rollbackWaypoint(WaypointId wid) =>
      copyWith(waypointStore: waypointStore.rollbackNode(wid));

  WaypointStore clear() {
    return copyWith(waypointStore: GraphCollectionStore<WaypointFields>());
  }
}
