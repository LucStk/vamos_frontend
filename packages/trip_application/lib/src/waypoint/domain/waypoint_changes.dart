import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';
import 'package:trip_application/src/waypoint/domain/waypoint_model.dart';

class WaypointChanges {
  const WaypointChanges({
    this.title,
    this.description,
    this.poiCategory,
    this.position,
    this.anchorPosition,
  });

  final String? title;
  final String? description;
  final PoiCategory? poiCategory;
  final LatLng? position;
  final double? anchorPosition;

  // Les anciens flags restent disponibles : le code existant ne change pas.
  bool get moved => position != null;
  bool get anchorEdited => anchorPosition != null;
  bool get isEmpty =>
      title == null &&
      description == null &&
      poiCategory == null &&
      position == null &&
      anchorPosition == null;

  factory WaypointChanges.between(WaypointFields? server, WaypointFields next) {
    // Pas de référence : on envoie tout, le serveur recalcule l'ancre.
    if (server == null) {
      return WaypointChanges(
        title: next.title,
        description: next.description,
        poiCategory: next.poiCategory,
        position: next.position,
      );
    }
    T? diff<T>(T a, T b) => a != b ? b : null;
    return WaypointChanges(
      title: diff(server.title, next.title),
      description: diff(server.description, next.description),
      poiCategory: diff(server.poiCategory, next.poiCategory),
      position: diff(server.position, next.position),
      anchorPosition: diff(server.anchorPosition, next.anchorPosition),
    );
  }
}
