// L'EffectRunner connaît le store, pas le reducer
import 'package:domain_core/notification/failure.dart';
import 'package:map_application/map_application.dart';
import "package:trip_application/trip_application.dart";

class IntentResolver {
  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;
  final MapOutput mapOutput;
  final void Function(MapEvent) dispatch;
  IntentResolver({
    required this.graphEditor,
    required this.waypointEditor,
    required this.mapOutput,
    required this.dispatch,
  });

  Future<void> run(MapIntents intent) async {
    switch (intent) {
      case CreateSimpleVertex e:
        await graphEditor.createSimpleVertex(e.position);
      case UpdateVertexPosition e:
        await graphEditor.moveVertex(e.vertexId, e.position);
      case CreateWaypointFromVertex e:
        await waypointEditor.createBlankWaypointFromVertex(
          VertexId(e.vertexId.value),
        );
      case CreateWaypointFromPosition e:
        final res = await waypointEditor.createBlankWaypointFromPosition(
          e.latLng,
        );
        res.fold(
          (Failure f) => dispatch(WaypointCreateFailed()),
          (WaypointCreateBlankRes data) =>
              dispatch(WaypointCreated(data.waypoint.vertexId)),
        );
      case CreateSegment e:
        final res = await graphEditor.createSegment(
          startVertexId: e.startVertexId,
          endVertexId: e.endVertexId,
          geometry: e.geometry,
          mobilityType: e.mobilityType,
        );
        res.fold(
          (Failure f) => dispatch(SegmentCreateFailed()),
          (SegmentRemoteModel waypoint) =>
              dispatch(SegmentCreated(waypoint.id)),
        );
      case DeleteSegment e:
        await graphEditor.deleteSegment(e.segmentId);
      case RemoveVertex e:
        await graphEditor.removeVertex(e.vertexId);
      case OpenWaypointDialog e:
        mapOutput.emit(WaypointOpenDialog(e.waypointId));

      case _:
        print("Resolver not found for intent $intent");
    }
  }
}
