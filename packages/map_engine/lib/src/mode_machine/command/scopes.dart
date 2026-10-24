// command/scopes.dart
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

// extension TopologyScopeX on TopologyScope {
//   RouteSectionFields? segment(SectionId id) =>
//       routeEditor.state.sectionStore.get(id)?.current;
//   WaypointFields? waypoint(WaypointId id) =>
//       waypointEditor.waypointStore.get(id)?.current;
// }

// --- Scopes de mode : un par mode de AppMode ---
abstract interface class ExploreScope implements CommonScope {
  RouteFields? getRoute(TripId tripId);
}

abstract interface class TripEditScope implements CommonScope, WaypointScope {
  RouteEditor get routeEditor;
  TripEditor get tripEditor;
  TripId get tripId;
  RouteFields? getRoute(TripId tripId);
  RouteSectionFields? section(SectionId section);
}

abstract interface class TripCreateScope implements CommonScope {
  TripEditor get tripEditor;
}
