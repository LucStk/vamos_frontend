// L'EffectRunner connaît le store, pas le reducer.
import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/editor.dart';
import 'package:trip_application/trip_application.dart';

sealed class MapEffect {
  const MapEffect();

  Future<void> run(MapEditor context);
}

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

final class PatchVertexPosition extends MapEffect {
  final VertexId vertexId;
  final LatLng position;

  const PatchVertexPosition(this.vertexId, this.position);

  @override
  Future<void> run(MapEditor context) async {
    final patchVertex = VertexPatchModel(id: vertexId, latLng: position);
    context.graphEditor.state = context.graphEditor.state.setVertex(
      patchVertex,
    );
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

    res.fold(
      (_) => context.sendUiEvent(WaypointCreateFailed()),
      (data) => context.sendUiEvent(WaypointCreated(data.vertex)),
    );
  }
}

final class CreateSegment extends MapEffect {
  final VertexId startVertexId;
  final VertexId endVertexId;
  final List<LatLng> geometry;
  final MobilityType mobilityType;

  const CreateSegment({
    required this.startVertexId,
    required this.endVertexId,
    required this.geometry,
    required this.mobilityType,
  });

  @override
  Future<void> run(MapEditor context) async {
    final res = await context.graphEditor.createSegment(
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometry,
      mobilityType: mobilityType,
    );

    res.fold(
      (_) => context.sendUiEvent(SegmentCreateFailed()),
      (segment) => context.sendUiEvent(SegmentCreated(segment.id)),
    );
  }
}

final class DeleteSegment extends MapEffect {
  final SegmentId segmentId;

  const DeleteSegment(this.segmentId);

  @override
  Future<void> run(MapEditor context) {
    return context.graphEditor.deleteSegment(segmentId);
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

final class OpenWaypointDialog extends MapEffect {
  final WaypointId waypointId;

  const OpenWaypointDialog(this.waypointId);

  @override
  Future<void> run(MapEditor context) async {
    context.mapOutput.emit(WaypointOpenDialog(waypointId));
  }
}
