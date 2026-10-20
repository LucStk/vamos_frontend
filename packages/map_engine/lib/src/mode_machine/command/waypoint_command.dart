import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:trip_application/trip_application.dart';

sealed class WaypointCommand<R extends Object>
    extends Command<R, TripEditScope> {
  const WaypointCommand();
}

final class CreateWaypoint extends WaypointCommand<WaypointId> {
  const CreateWaypoint(this.position);
  final OffsetType position;

  @override
  Future<WaypointId?> handle(TripEditScope h) {
    final latLng = switch (position) {
      WorldOffset d => h.camera.worldOffsetToLatLng(d),
      ScreenOffset d => h.camera.screenOffsetToLatLng(d),
    };
    return valueOrNull(
      h.waypointEditor
          .createBlankWaypoint(latLng)
          .then((r) => r.map((v) => v.id)), // Either<Failure, WaypointId>
    );
  }
}

final class RemoveWaypoint extends WaypointCommand<Done> {
  const RemoveWaypoint(this.waypointId);
  final WaypointId waypointId;

  @override
  Future<Done?> handle(TripEditScope h) =>
      done(() => h.waypointEditor.deleteWaypoint(waypointId));
}
