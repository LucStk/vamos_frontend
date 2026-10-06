import 'package:domain_core/domain/collection_store.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/utiles/merge_polyline.dart';
import 'package:trip_application/trip_application.dart';

final class EditTripCommandResolver extends ModeCommandResolver<MapEditorMode> {
  const EditTripCommandResolver({
    required this.graphEditor,
    required this.waypointEditor,
  });

  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;

  SegmentFields? _segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;

  @override
  Future<ModeCommandPayload<MapEditorMode>> resolve(
    ModeCommand<MapEditorMode> command,
  ) async {
    switch (command) {
      case CreateSimpleVertex c:
        await graphEditor.createSimpleVertex(c.position);
        return const NoResult();

      case MoveVertex c:
        await graphEditor.moveVertex(c.vertexId, c.position);
        return const NoResult();

      case RemoveVertex c:
        await graphEditor.removeVertex(c.vertexId);
        return VertexRemoved(c.vertexId);

      case CreateWaypointFromVertex c:
        await waypointEditor.createBlankWaypointFromVertex(c.vertexId);
        return const NoResult();

      case CreateWaypointFromPosition c:
        await waypointEditor.createBlankWaypointFromPosition(c.position);
        return const NoResult();

      case CreateSegmentFromSketch c:
        final res = await graphEditor.createSegment(
          startVertexId: c.startVertexId,
          endVertexId: c.endVertexId,
          geometry: c.geometry,
          mobilityType: c.mobilityType,
        );
        return res.fold(
          (_) => const NoResult(),
          (d) => SegmentCreated(d.segment),
        );

      case SpliceSegment c:
        final segment = _segment(c.segmentId);
        if (segment == null) return const NoResult();
        final res = await graphEditor.spliceSegment(
          correction: c.correction,
          mobilityType: segment.mobilityType,
          startAnchor: c.startAnchor,
          endAnchor: c.endAnchor,
        );
        return res.fold((_) => const NoResult(), (d) => SegmentSpliced(d.$2));

      case EditSegmentFromSketch c:
        final res = await graphEditor.updateSegment(c.patch);
        return res.fold(
          (_) => const NoResult(),
          (_) => SegmentUpdated(c.patch.id),
        );



      case CorrectSegmentFromSketch c:
        final segment = _segment(c.segmentId);
        if (segment == null) return const NoResult();
        final patch = SegmentPatchModel.fromFields(
          segment,
        ).copyWith(geometry: mergeCorrection(c.correction, segment.geometry));
        final res = await graphEditor.correctSegment(patch, c.correction);
        return res.fold(
          (_) => const NoResult(),
          (_) => SegmentCorrected(c.segmentId),
        );


    }
    return NoResult();
  }
}
