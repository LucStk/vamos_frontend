import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/route/commands/route_command.dart';
import 'package:map_engine/src/modes/trip_edit/route/route_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/slots/route_selection_slot.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';

/// Extrémité de la route.
enum RouteEnd { start, end }

/// Raccourcir la route par une extrémité : ouvert en glissant le départ ou
/// l'arrivée de la route depuis [TripEditMode].
///
/// Réutilise la sélection de `SelectRouteMode` ([routeSelectionSlot]), donc
/// son rendu (surlignage, poignées) : la poignée `a` reste fixée sur
/// l'extrémité, seule `b` (le curseur) se déplace. La portion sélectionnée
/// va de l'extrémité au curseur, et peut être supprimée.
final class TrimRouteMode extends RouteToolMode {
  TrimRouteMode(super.tripId, {required this.end, required this.anchor});

  /// Extrémité saisie.
  final RouteEnd end;

  /// Position de l'extrémité sur la polyline (même repère que
  /// `RouteHitDetail.position`), fournie par le hit test au moment de l'appui.
  final double anchor;

  @override
  Transition get back => Transition.to(TripEditMode(tripId));

  @override
  Iterable<SlotChange> get initialSlots => [
    (routeSelectionSlot, RouteSelection.collapsedAt(anchor)),
  ];

  @override
  Transition onDragging(DragUpdateGesture g) =>
      switch ((g.source.object, g.detail)) {
        // Le glissement qui a ouvert le mode (depuis l'extrémité), ou un
        // nouveau glissement depuis l'une ou l'autre extrémité : le curseur
        // suit le doigt.
        (MapTripStart() || MapTripEnd(), RouteDragDetail(:final position)) ||
        // Le curseur lui-même. La poignée `a` (l'extrémité) ne bouge jamais.
        (
          SelectionHandle(id: HandleId.b),
          RouteDragDetail(:final position),
        ) => Transition.update(
          routeSelectionSlot,
          (s) => s.withHandleAt(HandleId.b, position),
        ),
        _ => Transition.stay(),
      };

  /// Supprime la portion entre l'extrémité et le curseur, puis revient à
  /// l'édition sans outil. Rien à faire si la sélection est vide.
  Transition deleteSelection() =>
      Transition.withSlot<RouteSelection>(routeSelectionSlot, (s) {
        // ADAPTEZ : getters de RouteSelection supposés (`isCollapsed`, `b`).
        if (s.isCollapsed) return Transition.stay();
        return Transition.run(
          TrimRoute(tripId: tripId, end: end, at: s.b),
          then: (_, result) => result.fold(
            (_) => Transition.stay(),
            (_) => Transition.to(TripEditMode(tripId)),
          ),
        );
      });
}
