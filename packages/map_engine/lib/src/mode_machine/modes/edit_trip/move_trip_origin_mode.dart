// mode just après avoir créé un trip pour poser le premier point

import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/origin_placement.dart';
import 'package:map_engine/src/mode_machine/slots/trip_origin_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

final class MoveTripOriginMode extends TripEditableMode with OriginPlacement {
  const MoveTripOriginMode(super.tripId);

  static Transition<AppMode> start(TripId tripId, WorldOffset from) =>
      Transition.to(
        MoveTripOriginMode(tripId),
      ).and(tripOriginSlot, TripOrigin(from));
}
