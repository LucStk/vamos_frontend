import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';
import 'package:map_engine/src/modes/explore/explore_mode.dart';
import 'package:map_engine/src/modes/place_origin/commands/place_origin_command.dart';
import 'package:map_engine/src/modes/place_origin/slots/trip_origin_slot.dart';
import 'package:map_engine/src/modes/shared/cursor_actions.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_edition_mode.dart';
import 'package:trip_application/trip_application.dart';

import 'package:map_engine/src/domain/domain.dart';

sealed class PlaceOriginMode extends AppMode {
  const PlaceOriginMode();

  @override
  Set<Slot> get retainedSlots => {tripOriginSlot};
}

final class PlaceNewTripOrigin extends PlaceOriginMode {
  const PlaceNewTripOrigin();

  /// Un tap sur la carte pose l'origine ; le panneau la valide. Toucher
  /// l'origine déjà posée ne la déplace pas.
  @override
  Transition onTap(TapGesture g) => switch (g.element) {
    MapTmpOrigin _ => Transition.stay(),
    _ => placeAt(g.world),
  };

  @override
  Transition onDragging(DragUpdateGesture g) => placeAt(g.world);

  // Plus de menu contextuel : le panneau valide.
  @override
  Transition onDragEnd(DragEndGesture g) => Transition.stay();

  /// Pose (ou déplace) l'origine : tap, glisser, ou résultat de recherche.
  Transition placeAt(WorldOffset origin) =>
      Transition.set(tripOriginSlot, TripOrigin(origin));

  /// Crée le trip à [origin], avec [title] s'il n'est pas vide.
  Transition validate(WorldOffset origin, {String title = ''}) => Transition.run(
    CreateTrip(origin, title: title),
    then: (_, data) => data.fold(
      (Failure f) => Transition.stay(),
      (trip) => TripMode.open(trip.id),
    ),
  );

  Transition cancel() => Transition.to(ExploreMode());
}

final class PlaceExistingTripOrigin extends PlaceOriginMode {
  const PlaceExistingTripOrigin(this.tripId);
  final TripId tripId;

  @override
  Transition get back => Transition.to(ExploreMode());

  // Le curseur suit : le tracé démarre depuis l'origine avec lui.
  @override
  Set<Slot> get retainedSlots => {...super.retainedSlots, searchResultMarkerSlot};

  // Plus de menu contextuel : le panneau propose la suite. Toucher la position
  // de l'utilisateur y pose le curseur.
  @override
  Transition onTap(TapGesture g) => CursorActions.onTap(g) ?? Transition.stay();

  /// Le déplacement est enregistré à la fin du drag.
  @override
  Transition onDragEnd(DragEndGesture g) =>
      Transition.run(SetTripOrigin(position: g.world, tripId: tripId));

  @override
  Transition onDragging(DragUpdateGesture g) =>
      Transition.run(PatchTripOrigin(position: g.world, tripId: tripId));

  /// Passe au tracé, le crayon déjà posé sur l'origine [origin] : inutile de
  /// la toucher d'abord.
  Transition startRoute(WorldOffset origin) => SketchEdition.startFromOrigin(
    HitObject(object: MapTripStart(tripId), point: origin),
  );

  @override
  bool operator ==(Object other) =>
      other is PlaceExistingTripOrigin && other.tripId == tripId;
  @override
  int get hashCode => Object.hash(runtimeType, tripId);
}
