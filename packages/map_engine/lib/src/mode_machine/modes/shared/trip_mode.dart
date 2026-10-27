import 'package:map_engine/src/mode_machine/command/trip_entry.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/modes/explore/trip_read_only_mode.dart';
import 'package:map_engine/src/mode_machine/modes/place_origin/place_origin_mode.dart';
import 'package:map_engine/src/mode_machine/slots/selection_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

abstract class TripMode extends AppMode {
  const TripMode(this.tripId);
  final TripId tripId;
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  static Transition<AppMode> open(TripId id) =>
      Transition.run<AppMode, TripEntry>(
        ResolveTripEntry(id),
        then: (_, entry) => switch (entry) {
          TripReadOnly() => Transition.to(TripReadOnlyMode(id)),
          TripReady() => Transition.to(TripActiveMode(id)),
          TripNeedsOrigin(:final from) => PlaceOriginMode.forTrip(id, from),
          TripUnavailable _ => throw Exception,
        },
      );
}
