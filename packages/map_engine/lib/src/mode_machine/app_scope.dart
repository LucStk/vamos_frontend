// command/scopes.dart
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

// command/scopes.dart
abstract class AppCommandScope {
  CameraDirector get director;
  MapCameraController get camera;
  TripEditor get tripEditor; // global : crée/liste les trips

  TripScope forTrip(TripId tripId);
}

/// Tout ce qui dépend d'un trip précis.
abstract class TripScope {
  TripId get tripId;
  RouteEditor get routeEditor;
  WaypointEditor get waypointEditor;
  RouteFields? get route;
  RouteSectionFields? section(SectionId id);
}
