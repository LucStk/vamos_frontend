// command/scopes.dart
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import "package:user_profile_application/user_profile_application.dart";

// command/scopes.dart
abstract class AppCommandScope {
  CameraDirector get director;
  MapCameraController get camera;
  TripEditor get tripEditor; // global : crée/liste les trips
  UserId? get currentUserId;
  TripScope forTrip(TripId tripId);
}

/// Tout ce qui dépend d'un trip précis.
abstract class TripScope {
  Trip get trip;
  RouteEditor get routeEditor;
  WaypointEditor get waypointEditor;
  RouteFields? get route;
  RouteSectionFields? section(SectionId id);
}
