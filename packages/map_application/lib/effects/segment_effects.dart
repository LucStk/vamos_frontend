part of 'map_effects.dart';

extension SegmentMapEffects on MapEffects {
  Future<void> createSegmentFromSketch({
    required VertexId startVertexId,
    VertexId? endVertexId,
    required List<LatLng> geometry,
    required MobilityType mobilityType,
  }) async {
    final res = await graphEditor.createSegment(
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometry,
      mobilityType: mobilityType,
    );
    res.fold((_) {}, (data) {
      mapState = Idle(
        selection: MapSegment(data.segment.id, data.segment.geometry),
      );
    });
  }

  Future<void> spliceSegment({
    required List<LatLng> correction,
    required MobilityType mobilityType,
    required SpliceAnchor startAnchor,
    required SpliceAnchor endAnchor,
  }) async {
    final res = await graphEditor.spliceSegment(
      correction: correction,
      mobilityType: mobilityType,
      startAnchor: startAnchor,
      endAnchor: endAnchor,
    );

    res.fold((_) {}, (data) {
      final (_, segment) = data;
      mapState = Idle(selection: MapSegment(segment.id, segment.geometry));
    });
  }

  Future<void> editSegmentFromSketch(SegmentPatchModel patch) async {
    final res = await graphEditor.updateSegment(patch);
    res.fold((_) {}, (_) => _resetCorrectionIfNeeded());
  }

  Future<void> correctSegmentFromSketch({
    required SegmentPatchModel patchSegment,
    required List<LatLng> correction,
  }) async {
    final res = await graphEditor.correctSegment(patchSegment, correction);
    res.fold((_) {}, (_) => _resetCorrectionIfNeeded());
  }

  Future<void> deleteSegment(SegmentId segmentId) {
    return graphEditor.deleteSegment(segmentId);
  }

  void _resetCorrectionIfNeeded() {
    if (mapState case SketchEdition e) {
      mapState = e.copyWith(correction: null);
    }
  }
}
