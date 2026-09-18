import 'package:domain_core/domain/collection_store.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/utiles/merge_polyline.dart';
import 'package:trip_application/topology/topology.dart';

extension MapEditorSegments on MapEditorController {
  Future<void> createSegmentFromSketch({
    required VertexId startVertexId,
    required List<LatLng> geometry,
    required MobilityType mobilityType,
    VertexId? endVertexId,
  }) async {
    final res = await graphEditor.createSegment(
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometry,
      mobilityType: mobilityType,
    );
    return res.fold((_) => null, (data) {
      mode = Idle(
        selection: MapSegment(data.segment.id, data.segment.geometry),
      );
    });
  }

  Future<void> spliceSegment({
    required List<LatLng> correction,
    required SegmentId segmentId,
    required SpliceAnchor startAnchor,
    required SpliceAnchor endAnchor,
  }) async {
    final segment = graphEditor.state.segmentStore.get(segmentId)?.current;

    if (segment == null) {
      return;
    }

    final res = await graphEditor.spliceSegment(
      correction: correction,
      mobilityType: segment.mobilityType,
      startAnchor: startAnchor,
      endAnchor: endAnchor,
    );

    return res.fold((_) => null, (data) {
      final (_, segment) = data;

      mode = Idle(selection: MapSegment(segment.id, segment.geometry));
    });
  }

  Future<void> editSegmentFromSketch(SegmentPatchModel patch) async {
    final res = await graphEditor.updateSegment(patch);

    return res.fold((_) => null, (_) {
      if (mode case SketchEdition e) {
        mode = e.copyWith(path: []);
      }
      return;
    });
  }

  Future<void> changeSelectedSegmentType(MobilityType type) async {
    if (mode.selection case MapSegment(:final id)) {
      final segment = graphEditor.state.segmentStore.get(id)?.current;

      if (segment == null) {
        return;
      }
      final patch = SegmentPatchModel.fromFields(
        segment,
      ).copyWith(mobilityType: type);

      final res = await graphEditor.updateSegment(patch);
      return res.fold((_) => null, (_) => null);
    }

    return;
  }

  Future<void> correctSegmentFromSketch({
    required SegmentId segmentId,
    required List<LatLng> correction,
  }) async {
    final segment = graphEditor.state.segmentStore.get(segmentId)?.current;

    if (segment == null) {
      return;
    }

    final geometry = mergeCorrection(correction, segment.geometry);

    final patch = SegmentPatchModel.fromFields(
      segment,
    ).copyWith(geometry: geometry);

    final res = await graphEditor.correctSegment(patch, correction);

    return res.fold((_) => null, (_) {
      if (mode case SketchEdition e) {
        mode = e.copyWith(path: []);
      }

      return;
    });
  }

  Future<void> deleteSegment(SegmentId segmentId) async {
    final initialSelection = mode.selection;
    final res = await graphEditor.deleteSegment(segmentId);

    res.fold((_) => null, (_) {
      if (mode.selection == initialSelection) {
        mode = mode.withSelection(null);
      }
    });
  }
}
