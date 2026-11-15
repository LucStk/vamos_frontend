import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';
import 'package:map_engine/src/modes/place_origin/place_origin_mode.dart';
import 'package:map_engine/src/modes/shared/commands/trip_entry.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/trip_ready/trip_ready_mode.dart';
import 'package:trip_application/trip_application.dart';

abstract class TripMode extends AppMode {
  const TripMode(this.tripId);
  final TripId tripId;
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

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
