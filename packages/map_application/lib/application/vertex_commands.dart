import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/domain.dart';
import 'package:trip_application/trip_application.dart';

sealed class VertexCommand extends MapCommand {
  const VertexCommand();
}

final class CreateSimpleVertex extends VertexCommand {
  const CreateSimpleVertex(this.position);
  final LatLng position;
}

final class MoveVertex extends VertexCommand {
  const MoveVertex(this.vertexId, this.position);
  final VertexId vertexId;
  final LatLng position;
}

final class RemoveVertex extends VertexCommand {
  const RemoveVertex(this.vertexId);
  final VertexId vertexId;
}

final class CreateWaypointFromVertex extends VertexCommand {
  const CreateWaypointFromVertex(this.vertexId);
  final VertexId vertexId;
}

final class CreateWaypointFromPosition extends VertexCommand {
  const CreateWaypointFromPosition(this.position);
  final LatLng position;
}
