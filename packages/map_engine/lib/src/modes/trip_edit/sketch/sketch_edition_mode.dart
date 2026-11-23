import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/cursor_actions.dart';
import 'package:map_engine/src/modes/shared/overlays/context_menu.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/commands/sketch_command.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_generating_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

class SketchEdition extends SketchToolMode {
  const SketchEdition(super.tripId, {this.failure});

  /// Échec de la dernière demande (validation, prévisualisation), à afficher
  /// dans le panneau. Disparaît dès que le tracé est modifié (redessiné,
  /// effacé) ou qu'une nouvelle demande est lancée.
  final Failure? failure;

  /// Toute modification du tracé fait disparaître l'échec affiché.
  Transition _editingTrace(Transition t) =>
      failure == null ? t : t.switchingTo(SketchEdition(tripId));

  /// Efface le tracé.
  Transition clearTrace() =>
      _editingTrace(Transition.set(sketchTraceSlot, null));

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot, searchResultMarkerSlot};

  /// On saisit le segment : le tracé démarre à ce point.
  /// On saisit le crayon : on retient où, par rapport à sa pointe.
  @override
  Transition onPointerDown(PressGesture g) => switch (g.element) {
    MapSketchPencil() => _editingTrace(
      Transition.update(sketchTraceSlot, (t) => t.grabbedAt(g.position.world)),
    ),
    _ => Transition.stay(),
  };

  /// Toucher la position de l'utilisateur y pose le curseur.
  @override
  Transition onTap(TapGesture g) => CursorActions.onTap(g) ?? super.onTap(g);

  /// Drag depuis un élément de route : le tracé naît ici, au point saisi.
  /// Drag depuis le Pencil : le tracé existe déjà, on ne touche à rien.
  @override
  Transition onDragStart(DragStartGesture g) {
    if (g.source.narrow<RouteElements>() case final hit?) {
      return _editingTrace(
        Transition.set(sketchTraceSlot, SketchTrace(startAnchor: hit)),
      );
    }
    return Transition.stay();
  }

  /// En dessous, le doigt est encore « sur » son point de départ :
  /// on n'accroche pas d'ancre d'arrivée.
  static const _minAnchorTravelPx = 24.0;

  @override
  Transition onDragging(DragUpdateGesture g) {
    if (!_drivesTrace(g.sourceObject)) return Transition.stay();

    final end = g.travelPx < _minAnchorTravelPx
        ? null
        : g.target?.narrow<RouteElements>();

    return _editingTrace(
      Transition.update(
        sketchTraceSlot,
        (t) => t.add(g.position.world).endingAt(end),
      ),
    );
  }

  @override
  Transition onDragEnd(DragEndGesture g) => Transition.overlay(
    TapMenu(HitObject(object: MapSketchPencil(), point: g.world)),
  );

  /// Le système a repris le pointeur après le spawn : on retire le tracé
  /// orphelin. Si le drag partait du Pencil, le tracé existait avant, on le garde.
  @override
  Transition onDragCancel(DragCancelGesture g) =>
      g.source.narrow<RouteElements>() != null
      ? _editingTrace(Transition.set(sketchTraceSlot, null))
      : Transition.stay();

  /// Valide le tracé tel qu'il a été dessiné, sans routeur (sections DRAWN).
  /// Le tracé est effacé et on reste ici pour en enchaîner un autre.
  Transition validateFreehand(MobilityType mobilityType) =>
      Transition.withSlot<SketchTrace>(sketchTraceSlot, (trace) {
        if (!trace.hasSegment) return Transition.stay();
        return _freehand(this, trace, mobilityType);
      });

  /// Écrit [trace] dans la route sans routeur, puis revient à [editing] avec
  /// un tracé vide (et, pour [consumesCursor], sans curseur).
  static Transition _freehand(
    SketchEdition editing,
    SketchTrace trace,
    MobilityType mobilityType, {
    bool consumesCursor = false,
  }) {
    final tripId = editing.tripId;
    final generating = SketchGenerating(tripId, editing);

    return Transition.to(generating).running(
      EditRoute(
        mobilityType: mobilityType,
        tripId: tripId,
        sketch: trace,
        autoRoute: false,
      ),
      then: (current, result) {
        final m = current.mode;
        // Annulé ou remplacé entre-temps : on ignore cette réponse.
        if (m is! SketchGenerating || m.token != generating.token) {
          return null;
        }
        return result.fold(
          (failure) => Transition.to(
            SketchEdition(tripId, failure: failure),
          ), // retour au tracé
          (_) {
            final done = Transition.to(editing).clearSlot(sketchTraceSlot);
            return consumesCursor
                ? done.clearSlot(searchResultMarkerSlot)
                : done;
          },
        );
      },
    );
  }

  /// Tracé de [from] jusqu'au curseur. [from] est l'arrivée de la route, ou
  /// l'origine d'un voyage sans route : alors l'origine fait partie du tracé,
  /// comme dans [startFromOrigin].
  static SketchTrace _traceToCursor(
    HitObject<RouteElements> from,
    WorldOffset cursor,
  ) => SketchTrace(
    startAnchor: from,
    points: from.object is MapTripStart ? [from.point, cursor] : [cursor],
  );

  /// Itinéraire calculé de [from] jusqu'au curseur, en aperçu à valider.
  static Transition routeToCursor(
    TripId tripId,
    HitObject<RouteElements> from,
    WorldOffset cursor,
    MobilityType mobilityType,
  ) => SketchGenerating.previewTrace(
    tripId,
    _traceToCursor(from, cursor),
    mobilityType,
  ).clearSlot(searchResultMarkerSlot);

  /// Ligne droite de [from] jusqu'au curseur, écrite directement.
  static Transition straightToCursor(
    TripId tripId,
    HitObject<RouteElements> from,
    WorldOffset cursor,
    MobilityType mobilityType,
  ) => _freehand(
    SketchEdition(tripId),
    _traceToCursor(from, cursor),
    mobilityType,
    consumesCursor: true,
  );

  /// Ouvre l'outil de tracé avec une ligne droite de [from] jusqu'au curseur,
  /// à valider telle quelle ou à faire router depuis le panneau. Le curseur est
  /// consommé : le tracé le remplace.
  static Transition sketchToCursor(
    TripId tripId,
    HitObject<RouteElements> from,
    WorldOffset cursor,
    MobilityType mobilityType,
  ) => Transition.to(SketchEdition(tripId))
      .and(sketchTraceSlot, _traceToCursor(from, cursor))
      .clearSlot(searchResultMarkerSlot);

  /// Ouvre l'outil de tracé, le crayon posé sur [from] (le curseur). Si la
  /// route n'a pas encore de point ([originOnly]), l'origine ouvre le tracé,
  /// comme dans [startFromOrigin].
  static Transition startFromCursor(
    TripId tripId,
    HitObject<RouteElements> from, {
    bool originOnly = false,
  }) => Transition.to(SketchEdition(tripId))
      .and(
        sketchTraceSlot,
        SketchTrace(
          startAnchor: from,
          points: originOnly && from.object is MapTripStart
              ? [from.point]
              : const [],
        ),
      )
      .clearSlot(searchResultMarkerSlot);

  /// Demande l'itinéraire du tracé, sans l'ajouter à la route.
  Transition preview(MobilityType mobilityType) =>
      SketchGenerating.preview(tripId, mobilityType);

  static Transition stop() =>
      Transition.withMode<SketchEdition>((s) => TripMode.open((s.tripId)));

  /// Depuis le menu ouvert sur l'origine de la route : passe en édition de
  /// tracé, ancré au départ de la route.
  static Transition startFromOrigin(HitObject<MapTripStart> hit) =>
      Transition.to(SketchEdition(hit.object.tripId)).and(
        sketchTraceSlot,
        SketchTrace(startAnchor: hit, points: [hit.point]),
      );

  /// Les deux seules origines qui pilotent le tracé.
  static bool _drivesTrace(MapObject o) =>
      o is RouteElements || o is MapSketchPencil;
}
