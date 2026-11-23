import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';
import 'package:trip_application/src/waypoint/domain/waypoint_model.dart';

class WaypointChanges {
  const WaypointChanges({
    this.title,
    this.description,
    this.kind,
    this.position,
    this.anchorPosition,
    this.kindCleared = false,
  });

  final String? title;
  final String? description;
  final WaypointKind? kind;
  final LatLng? position;
  final double? anchorPosition;

  /// La catégorie a été retirée : `kind` est null dans ce cas, comme pour
  /// « inchangée ».
  final bool kindCleared;

  // Les anciens flags restent disponibles : le code existant ne change pas.
  bool get moved => position != null;
  bool get anchorEdited => anchorPosition != null;
  bool get isEmpty =>
      title == null &&
      description == null &&
      kind == null &&
      !kindCleared &&
      position == null &&
      anchorPosition == null;

  factory WaypointChanges.between(WaypointFields? server, WaypointFields next) {
    // Pas de référence : on envoie tout, le serveur recalcule l'ancre.
    if (server == null) {
      return WaypointChanges(
        title: next.title,
        description: next.description,
        kind: next.kind,
        position: next.position,
      );
    }
    T? diff<T>(T? a, T? b) => a != b ? b : null;
    return WaypointChanges(
      title: diff(server.title, next.title),
      description: diff(server.description, next.description),
      kind: diff(server.kind, next.kind),
      kindCleared: server.kind != null && next.kind == null,
      position: diff(server.position, next.position),
      anchorPosition: diff(server.anchorPosition, next.anchorPosition),
    );
  }
}
