import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';
import 'package:map_engine/src/modes/place_origin/place_origin_mode.dart';
import 'package:map_engine/src/modes/shared/commands/camera_command.dart';
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

  /// Retour à la lecture du trip (modifiable), sans outil ni panneau ouvert :
  /// sortie de l'édition ([TripEditMode]) ou d'une sélection de portion de
  /// route (`SelectRouteMode`, `PortionPreviewMode`), ouverte depuis la lecture.
  Transition get exit => Transition.to(TripReadyMode(tripId, readOnly: false));

  /// Sortie d'un outil, d'une action contextuelle ou d'un panneau : on
  /// retrouve la lecture du trip sans rien d'ouvert. C'est la destination de
  /// la croix du panneau et du retour.
  ///
  /// Un mode qui tient une proposition non validée (aperçu, calcul en cours)
  /// la surcharge pour l'abandonner en partant.
  Transition get closeTool => exit;

  @override
  Transition get back => closeTool;

  /// Ouvre le trip, sans rien de sélectionné : une sélection restée de la
  /// dernière visite ne doit pas revenir.
  ///
  /// [focus] cadre la caméra sur le voyage une fois chargé ([FocusTrip]) :
  /// c'est le cas quand on arrive d'ailleurs (clic sur la carte, voyage
  /// choisi dans un profil), là où la carte ne montre pas encore le voyage.
  /// On le laisse à `false` pour un simple retour à la lecture (sortie
  /// d'édition, d'un outil), qui ne doit pas rebouger la vue.
  static Transition open(TripId id, {bool focus = false}) =>
      Transition.run<TripEntry>(
        ResolveTripEntry(id),
        then: (_, entry) {
          final next = switch (entry) {
            TripReady(:final readOnly) => Transition.to(
              TripReadyMode(id, readOnly: readOnly),
            ),
            TripNeedsOrigin() => Transition.to(PlaceExistingTripOrigin(id)),
            TripUnavailable _ => throw Exception,
          };
          // Aucune fiche d'ouverte en arrivant : ni jour, ni morceau, ni
          // étape, ni le trip lui-même (sa sélection ouvre sa fiche).
          final opened = next.and<MapObject>(selectionSlot, null);
          return focus ? opened.running(FocusTrip(id)) : opened;
        },
      );
}
