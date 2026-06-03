import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

/// Construit un [GWaypointFieldsData] minimal pour les tests.
GWaypointFieldsData gWaypointData({
  int id = 1,
  double lat = 48.85,
  double lng = 2.35,
  GWaypointEnum type = GWaypointEnum.WAYPOINT,
  String title = 'Mon waypoint',
  String description = 'Une description',
  List<GWaypointFieldsData_images> images = const [],
}) => GWaypointFieldsData(
  id: id,
  lat: lat,
  lng: lng,
  type: type,
  title: title,
  description: description,
  images: images,
);

/// Construit un [WaypointDraft] domaine minimal pour les tests.
WaypointDraft domainWaypointDraft({
  double lat = 48.85,
  double lng = 2.35,
  WaypointType type = WaypointType.waypoint,
  String title = '',
  String description = '',
}) => WaypointDraft(
  latLng: LatLng(lat, lng),
  type: type,
  title: title,
  description: description,
);

/// Construit un [Waypoint] domaine minimal pour les tests.
Waypoint domainWaypoint({
  int id = 1,
  double lat = 48.85,
  double lng = 2.35,
  WaypointType type = WaypointType.waypoint,
  String title = '',
  String description = '',
}) => Waypoint(
  id: id,
  latLng: LatLng(lat, lng),
  type: type,
  title: title,
  description: description,
);
