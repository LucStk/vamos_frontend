import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_trip/commands/edit_trip_command.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

final class TripEditMode extends TripMode {
  const TripEditMode(super.tripId);

  Transition deleteTripRoute() => Transition.run(
    DeleteRoute(tripId: tripId),
    then: (_, data) =>
        data.fold((l) => Transition.stay(), (_) => TripMode.open(tripId)),
  );
}
