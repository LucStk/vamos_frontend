import 'package:trip_application/src/waypoint/domain/waypoint_model.dart';

class WaypointChanges {
  final bool moved;
  final bool anchorEdited;

  const WaypointChanges({required this.moved, required this.anchorEdited});

  /// Compare la valeur à envoyer à la dernière valeur confirmée par le serveur.
  factory WaypointChanges.between(WaypointFields? server, WaypointFields next) {
    // Pas de référence : on envoie la position, le serveur recalcule l'ancre.
    if (server == null) {
      return const WaypointChanges(moved: true, anchorEdited: false);
    }
    return WaypointChanges(
      moved: server.position != next.position,
      anchorEdited: server.anchorPosition != next.anchorPosition,
    );
  }
}
