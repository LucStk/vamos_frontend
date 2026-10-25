import 'package:domain_core/map_geo_bounds.dart';
import 'package:map_engine/src/domain/camera/camera_request.dart';
import 'package:map_engine/src/mode_machine/app_scope.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:trip_application/trip_application.dart';

sealed class ExploreCommand<R extends Object> extends Command<Done> {
  const ExploreCommand();
}

final class FocusTrip extends ExploreCommand<Done> {
  const FocusTrip(this.tripId);
  final TripId tripId;
  @override
  Future<Done> handle(AppCommandScope n) async {
    final bounds = n.forTrip(tripId).route?.bounds;
    if (bounds != null) {
      n.director.submit(
        CameraRequest(
          FitBounds(bounds, padding: MapEdgeInsets.all(250)),
          priority: CameraPriority.explicit,
        ),
      );
    }
    return const Done();
  }
}
