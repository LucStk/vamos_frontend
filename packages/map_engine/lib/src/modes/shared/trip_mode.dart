import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';
import 'package:map_engine/src/modes/place_origin/place_origin_mode.dart';
import 'package:map_engine/src/modes/shared/commands/trip_entry.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/trip/trip_ready_mode.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';
import 'package:trip_application/trip_application.dart';

abstract class TripMode extends AppMode {
  const TripMode(this.tripId);
  final TripId tripId;
  @override
  Set<Slot> get retainedSlots => const {selectionSlot, searchResultMarkerSlot};

  /// Sortie de l'édition vers la lecture du trip (modifiable). Dernière étape
  /// du retour : on n'y arrive que depuis [TripEditMode], sans outil ni
  /// panneau ouvert.
  Transition get exit => Transition.to(TripReadyMode(tripId, readOnly: false));

  /// Sortie d'un outil, d'une action contextuelle ou d'un panneau : on
  /// retrouve l'édition du trip sans rien d'ouvert. C'est la destination de la
  /// croix du panneau, et un cran seulement du retour : quitter l'édition
  /// demande ensuite un second retour ([TripEditMode.back]).
  ///
  /// Un mode qui tient une proposition non validée (aperçu, calcul en cours)
  /// la surcharge pour l'abandonner en partant.
  Transition get closeTool => Transition.to(TripEditMode(tripId));

  @override
  Transition get back => closeTool;

  /// Ouvre le trip, sans rien de sélectionné : une sélection restée de la
  /// dernière visite ne doit pas revenir.
  static Transition open(TripId id) => Transition.run<TripEntry>(
    ResolveTripEntry(id),
    then: (_, entry) {
      final next = switch (entry) {
        TripReady(:final readOnly) => Transition.to(
          TripReadyMode(id, readOnly: readOnly),
        ),
        TripNeedsOrigin() => Transition.to(PlaceExistingTripOrigin(id)),
        TripUnavailable _ => throw Exception,
      };
      // Aucune fiche d'ouverte en arrivant : ni jour, ni morceau, ni étape, ni
      // le trip lui-même (sa sélection ouvre sa fiche).
      return next.and<MapObject>(selectionSlot, null);
    },
  );
}
