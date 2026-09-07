part of 'map_effects.dart';

final class CreateSegmentFromSketch extends MapEffect {
  final VertexId startVertexId;
  final VertexId? endVertexId;
  final List<LatLng> geometry;
  final MobilityType mobilityType;

  const CreateSegmentFromSketch({
    required this.startVertexId,
    this.endVertexId,
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
    res.fold((_) {}, (data) {
      final (segment, _) = data;
      context.segmentCreated(segment);
      context.mode = Idle();
      context.selection = MapSegment(segment);
    });
  }
}

final class SpliceSegment extends MapEffect {
  final List<LatLng> correction;
  final MobilityType mobilityType;
  final SpliceAnchor startAnchor;
  final SpliceAnchor endAnchor;

  const SpliceSegment({
    required this.correction,
    required this.mobilityType,
    required this.startAnchor,
    required this.endAnchor,
  });

  @override
  Future<void> run(MapEditor context) async {
    final res = await context.graphEditor.spliceSegment(
      correction: correction,
      mobilityType: mobilityType,
      startAnchor: startAnchor,
      endAnchor: endAnchor,
    );

    res.fold((_) {}, (data) {
      final (_, segment) = data;
      context.segmentEdited(segment);
      switch (context.mode) {
        case SketchEdition e:
          context.mode = e.copyWith(correction: null);
        case _:
      }
      // context.mode = Idle();
      // context.selection = SegmentSelection(segmentId: segment.id);
    });
  }
}

final class EditeSegmentFromSketch extends MapEffect {
  final SegmentPatchModel patch;
  const EditeSegmentFromSketch({required this.patch});

  @override
  Future<void> run(MapEditor context) async {
    final res = await context.graphEditor.updateSegment(patch);
    res.fold((_) {}, (segment) {
      context.segmentEdited(segment);
      switch (context.mode) {
        case SketchEdition e:
          context.mode = e.copyWith(correction: null);
        case _:
      }
      // context.mode = Idle();
      // context.selection = SegmentSelection(segmentId: segment.id);
    });
  }
}

final class CorrectSegmentFromSketch extends MapEffect {
  final SegmentPatchModel patchSegment;
  final List<LatLng> correction;
  const CorrectSegmentFromSketch({
    required this.patchSegment,
    required this.correction,
  });

  @override
  Future<void> run(MapEditor context) async {
    final res = await context.graphEditor.correctSegment(
      patchSegment,
      correction,
    );
    res.fold((_) {}, (segment) {
      context.segmentEdited(segment);
      switch (context.mode) {
        case SketchEdition e:
          context.mode = e.copyWith(correction: null);
        case _:
      }
      // context.mode = Idle();
      // context.selection = SegmentSelection(segmentId: segment.id);
    });
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
