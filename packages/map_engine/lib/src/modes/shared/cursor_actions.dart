import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/trip_edit/waypoint/commands/waypoint_command.dart';
import 'package:trip_application/trip_application.dart';

/// Le curseur : un point posé sur la carte par un résultat de recherche ou en
/// touchant la position de l'utilisateur ([searchResultMarkerSlot]). Le panneau
/// du mode propose alors des actions sur ce point.
abstract final class CursorActions {
  /// Pose le curseur en [point], sur [anchor] s'il repose sur la route.
  static Transition place(
    WorldOffset point, {
    HitObject<RouteElements>? anchor,
  }) => Transition.set(
    searchResultMarkerSlot,
    SearchResultMarker(point: point, anchor: anchor),
  );

  /// Retire le curseur.
  static Transition clear() =>
      Transition.set<SearchResultMarker>(searchResultMarkerSlot, null);

  /// Toucher la position de l'utilisateur ou la carte vide y pose le curseur ;
  /// null pour tout autre tap, à traiter par le mode.
  static Transition? onTap(TapGesture g) => switch (g.element) {
    MapLocalization(:final position) => place(position),
    null => place(g.world),
    _ => null,
  };

  /// Crée une étape sur le curseur, qui disparaît ensuite. La nouvelle étape
  /// est sélectionnée : halo et ancre apparaissent, prêtes à être ajustées.
  static Transition createWaypoint(TripId tripId, WorldOffset cursor) =>
      Transition.run(
        CreateWaypoint(tripId: tripId, position: cursor),
        then: (_, id) => clear().and<MapObject>(
          selectionSlot,
          MapWaypoint(id: id, tripId: tripId),
        ),
      );
}
