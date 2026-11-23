import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';
import 'package:map_engine/src/modes/place_origin/place_origin_mode.dart';
import 'package:map_engine/src/modes/shared/commands/trip_entry.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/trip/trip_ready_mode.dart';
import 'package:trip_application/trip_application.dart';

abstract class TripMode extends AppMode {
  const TripMode(this.tripId);
  final TripId tripId;
  @override
  Set<Slot> get retainedSlots => const {selectionSlot, searchResultMarkerSlot};

  /// Sortie de l'édition vers la lecture du trip (modifiable). C'est la
  /// destination de la flèche retour, de la croix des panneaux et du retour
  /// système, pour tous les modes de la boîte à outils.
  ///
  /// Un mode qui tient une proposition non validée (aperçu, calcul en cours)
  /// la surcharge pour l'abandonner en partant.
  Transition get exit => Transition.to(TripReadyMode(tripId, readOnly: false));

  @override
  Transition get back => exit;

  static Transition open(TripId id) => Transition.run<TripEntry>(
    ResolveTripEntry(id),
    then: (_, entry) => switch (entry) {
      TripReady(:final readOnly) => Transition.to(
        TripReadyMode(id, readOnly: readOnly),
      ),
      TripNeedsOrigin() => Transition.to(PlaceExistingTripOrigin(id)),
      TripUnavailable _ => throw Exception,
    },
  );
}
