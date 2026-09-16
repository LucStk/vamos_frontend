part of 'map_effects.dart';

class CreateSimpleVertexEffect extends MapEffectImpl {
  const CreateSimpleVertexEffect({required this.position});

  final LatLng position;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    await context.graphEditor.createSimpleVertex(position);
    return null;
  }
}

class UpdateRemoteVertexPositionEffect extends MapEffectImpl {
  const UpdateRemoteVertexPositionEffect({
    required this.vertexId,
    required this.position,
  });

  final VertexId vertexId;
  final LatLng position;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    await context.graphEditor.moveVertex(vertexId, position);
    return null;
  }
}

class CreateWaypointFromVertexEffect extends MapEffectImpl {
  const CreateWaypointFromVertexEffect({required this.vertexId});

  final VertexId vertexId;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    await context.waypointEditor.createBlankWaypointFromVertex(vertexId);
    return null;
  }
}

class CreateWaypointFromPositionEffect extends MapEffectImpl {
  const CreateWaypointFromPositionEffect({required this.position});

  final LatLng position;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    await context.waypointEditor.createBlankWaypointFromPosition(position);
    return null;
  }
}

class RemoveVertexEffect extends MapEffectImpl {
  const RemoveVertexEffect({required this.vertexId});

  final VertexId vertexId;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    await context.graphEditor.removeVertex(vertexId);
    return null;
  }
}

class DeleteSelectedVertexEffect extends MapEffectImpl {
  const DeleteSelectedVertexEffect();

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    if (context.mapState.selection case MapVertex(:final id)) {
      await context.graphEditor.removeVertex(id);
      return context.mapState.withSelection(null);
    }

    return null;
  }
}
