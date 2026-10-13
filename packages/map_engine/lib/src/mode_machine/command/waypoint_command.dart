import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/entities/vertex_model.dart';

import '../effect/results.dart';
import 'command.dart';
import 'scopes.dart';

sealed class WaypointCommand<R extends Object>
    extends Command<R, WaypointScope> {
  const WaypointCommand();
}

final class CreateWaypointFromVertex extends WaypointCommand<Done> {
  const CreateWaypointFromVertex(this.vertexId);
  final VertexId vertexId;

  @override
  Future<Done?> handle(WaypointScope h) =>
      done(() => h.waypointEditor.createBlankWaypointFromVertex(vertexId));
}

final class CreateWaypointFromPosition extends WaypointCommand<Done> {
  const CreateWaypointFromPosition(this.position);
  final LatLng position;

  @override
  Future<Done?> handle(WaypointScope h) =>
      done(() => h.waypointEditor.createBlankWaypointFromPosition(position));
}
