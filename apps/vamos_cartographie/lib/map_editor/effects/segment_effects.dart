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
    required SegmentId segmentId,
    required SpliceAnchor startAnchor,
    required SpliceAnchor endAnchor,
  }) async {
    final newSeg = graphEditor.state.segmentStore.get(segmentId)?.current;
    if (newSeg == null) return;
    final res = await graphEditor.spliceSegment(
      correction: correction,
      mobilityType: newSeg.mobilityType,
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

  Future<void> changeSegmentType(MobilityType type) async {
    if (mapState.selection case MapSegment(:final id)) {
      final newSeg = graphEditor.state.segmentStore.get(id)?.current;
      if (newSeg == null) return;
      final draft = SegmentPatchModel.fromFields(
        newSeg,
      ).copyWith(mobilityType: type);
      await graphEditor.updateSegment(draft);
    }
  }

  Future<void> correctSegmentFromSketch({
    required SegmentId segmentId,
    required List<LatLng> correction,
  }) async {
    final seg = graphEditor.state.segmentStore.get(segmentId)?.current;
    if (seg == null) return;
    List<LatLng> itineraire = mergeCorrection(correction, seg.geometry);
    final patch = SegmentPatchModel.fromFields(
      seg,
    ).copyWith(geometry: itineraire);
    final res = await graphEditor.correctSegment(patch, correction);
    res.fold((_) {}, (_) => _resetCorrectionIfNeeded());
  }

  Future<void> deleteSegment(SegmentId segmentId) async {
    final res = await graphEditor.deleteSegment(segmentId);
    res.fold((_) {}, (_) {
      mapState = mapState.withSelection(null);
    });
  }

  void _resetCorrectionIfNeeded() {
    if (mapState case SketchEdition e) {
      mapState = e.copyWith(path: []);
    }
  }
}
