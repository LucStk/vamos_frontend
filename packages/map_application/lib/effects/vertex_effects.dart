part of 'map_effects.dart';

final class CreateSimpleVertex extends MapEffect {
  final LatLng position;

  const CreateSimpleVertex(this.position);

  @override
  Future<void> run(MapEditor context) {
    return context.graphEditor.createSimpleVertex(position);
  }
}

final class UpdateRemoteVertexPosition extends MapEffect {
  final VertexId vertexId;
  final LatLng position;

  const UpdateRemoteVertexPosition(this.vertexId, this.position);

  @override
  Future<void> run(MapEditor context) {
    return context.graphEditor.moveVertex(vertexId, position);
  }
}

final class CreateWaypointFromVertex extends MapEffect {
  final VertexId vertexId;

  const CreateWaypointFromVertex(this.vertexId);

  @override
  Future<void> run(MapEditor context) {
    return context.waypointEditor.createBlankWaypointFromVertex(vertexId);
  }
}

final class CreateWaypointFromPosition extends MapEffect {
  final LatLng position;

  const CreateWaypointFromPosition(this.position);

  @override
  Future<void> run(MapEditor context) async {
    final res = await context.waypointEditor.createBlankWaypointFromPosition(
      position,
    );

    res.fold((_) {}, (data) => context.waypointCreated(data.vertex));
  }
}

final class RemoveVertex extends MapEffect {
  final VertexId vertexId;

  const RemoveVertex(this.vertexId);

  @override
  Future<void> run(MapEditor context) {
    return context.graphEditor.removeVertex(vertexId);
  }
}
