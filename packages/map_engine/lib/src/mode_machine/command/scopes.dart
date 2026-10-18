// command/scopes.dart
import 'package:domain_core/domain/collection_store.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

abstract interface class CommandScope {}

// command/scopes.dart
abstract interface class CommonScope implements CommandScope {
  CameraDirector get director;
  MapCameraController get camera;
}

// --- Capacités : ce qu'une commande déclare dans Command<R, Scope> ---
abstract interface class WaypointScope implements CommonScope {
  WaypointEditor get waypointEditor;
}

abstract interface class TopologyScope implements CommonScope {
  GraphEditor get graphEditor;
}

extension TopologyScopeX on TopologyScope {
  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
  VertexFields? vertex(VertexId id) =>
      graphEditor.state.vertexStore.get(id)?.current;
}

// --- Scopes de mode : un par mode de AppMode ---
abstract interface class ExploreScope implements CommonScope {
  Trip? getTrip(TripId tripId);
}

abstract interface class TripEditScope
    implements CommonScope, TopologyScope, WaypointScope {
  TripId get tripId;
}
