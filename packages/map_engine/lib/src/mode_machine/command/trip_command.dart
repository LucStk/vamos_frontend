import 'package:domain_core/map_geo_bounds.dart';
import 'package:map_engine/src/domain/camera/camera_request.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';
import 'package:map_engine/src/mode_machine/effect/results.dart';
import 'package:trip_application/trip/domain/trip.dart';

sealed class ExploreCommand<R extends Object>
    extends Command<Done, ExploreScope> {
  const ExploreCommand();
}

final class FocusTrip extends ExploreCommand<Done> {
  const FocusTrip(this.tripId);
  final TripId tripId;
  @override
  Future<Done> handle(ExploreScope n) async {
    final bounds = n.getTrip(tripId)?.bounds;
    if (bounds != null) {
      print("focus trip bounds ${bounds.toString()}");
      n.director.submit(
        CameraRequest(
          FitBounds(bounds, padding: MapEdgeInsets.all(200)),
          priority: CameraPriority.explicit,
        ),
      );
    }
    return const Done();
  }
}
