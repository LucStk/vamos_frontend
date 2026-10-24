// segment_select_mode.dart (ou son dossier)
import 'package:domain_core/failures.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';

import 'package:map_engine/src/mode_machine/app_mode.dart';
import 'package:map_engine/src/mode_machine/command/create_trip_command.dart';
import 'package:map_engine/src/mode_machine/command/edit_trip_command.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';
import 'package:map_engine/src/mode_machine/slots/trip_origin_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

final class TripOriginMenu extends MapObjectMenu<MapTripOrigin> {
  TripOriginMenu() : super(MapTripOrigin());

  @override
  MenuAnchor get anchor => TripOriginAnchor(object);

  Transition<AppMode> createTripWtOrigin() {
    return Transition.withSlot(
      tripOriginSlot,
      (slot) => Transition.run(
        CreateTrip(slot.point),
        then: (mode, res) => res.fold(
          (Failure f) => throw f,
          (trip) => Transition.to(TripActiveMode(trip.id)),
        ),
      ),
    );
  }

  Transition<AppMode> updateTripOrigin(TripId tripId) {
    return Transition.withSlot(
      tripOriginSlot,
      (slot) => Transition.run(
        UpdateTripOrigin(tripId: tripId, position: slot.point),
        then: (mode, res) => res.fold(
          (Failure f) => throw f,
          (payload) => Transition.to(TripActiveMode(tripId)),
        ),
      ),
    );
  }
}
