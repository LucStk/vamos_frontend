import 'package:domain_core/domain/collection_store.dart';
import 'package:map_application/map_application.dart';
import 'package:map_editor_application/application/commands/commands.dart';
import 'package:map_engine/utiles/merge_polyline.dart';
import 'package:trip_application/trip_application.dart';

final class MapCommandResolver {
  const MapCommandResolver({
    required this.graphEditor,
    required this.waypointEditor,
  });

  final GraphEditor graphEditor;
  final WaypointEditor waypointEditor;

  SegmentFields? _segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;

  Future<CommandResult> resolve(MapCommand command) async {
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

      case ChangeSelectedSegmentType c:
        final segment = _segment(c.segmentId);
        if (segment == null) return const NoResult();
        final patch = SegmentPatchModel.fromFields(
          segment,
        ).copyWith(mobilityType: c.mobilityType);
        await graphEditor.updateSegment(patch);
        return const NoResult();

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

      case DeleteSegment c:
        await graphEditor.deleteSegment(c.segmentId);
        return SegmentDeleted(c.segmentId);
    }
    return NoResult();
  }
}
