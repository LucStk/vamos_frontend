import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/src/mode_machine/app_scope.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:trip_application/trip_application.dart';

sealed class WaypointCommand<R extends Object> extends Command<R> {
  const WaypointCommand();
}

final class CreateWaypoint extends WaypointCommand<WaypointId> {
  const CreateWaypoint({required this.tripId, required this.position});
  final OffsetType position;
  final TripId tripId;

  @override
  Future<WaypointId?> handle(AppCommandScope h) {
    final latLng = switch (position) {
      WorldOffset d => h.camera.worldOffsetToLatLng(d),
      ScreenOffset d => h.camera.screenOffsetToLatLng(d),
    };
    return valueOrNull(
      h
          .forTrip(tripId)
          .waypointEditor
          .createBlankWaypoint(latLng)
          .then((r) => r.map((v) => v.id)), // Either<Failure, WaypointId>
    );
  }
}

final class RemoveWaypoint extends WaypointCommand<Done> {
  const RemoveWaypoint({required this.tripId, required this.waypointId});
  final WaypointId waypointId;
  final TripId tripId;

  @override
  Future<Done?> handle(AppCommandScope h) =>
      done(() => h.forTrip(tripId).waypointEditor.deleteWaypoint(waypointId));
}
