part of 'map_effects.dart';

class CreateSegmentFromSketchEffect extends MapEffectImpl {
  const CreateSegmentFromSketchEffect({
    required this.startVertexId,
    required this.geometry,
    required this.mobilityType,
    this.endVertexId,
  });

  final VertexId startVertexId;
  final VertexId? endVertexId;
  final List<LatLng> geometry;
  final MobilityType mobilityType;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    final res = await context.graphEditor.createSegment(
      startVertexId: startVertexId,
      endVertexId: endVertexId,
      geometry: geometry,
      mobilityType: mobilityType,
    );

    return res.fold(
      (_) => null,
      (data) =>
          Idle(selection: MapSegment(data.segment.id, data.segment.geometry)),
    );
  }
}

class SpliceSegmentEffect extends MapEffectImpl {
  const SpliceSegmentEffect({
    required this.correction,
    required this.segmentId,
    required this.startAnchor,
    required this.endAnchor,
  });

  final List<LatLng> correction;
  final SegmentId segmentId;
  final SpliceAnchor startAnchor;
  final SpliceAnchor endAnchor;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    final segment = context.graphEditor.state.segmentStore
        .get(segmentId)
        ?.current;

    if (segment == null) {
      return null;
    }

    final res = await context.graphEditor.spliceSegment(
      correction: correction,
      mobilityType: segment.mobilityType,
      startAnchor: startAnchor,
      endAnchor: endAnchor,
    );

    return res.fold((_) => null, (data) {
      final (_, segment) = data;

      return Idle(selection: MapSegment(segment.id, segment.geometry));
    });
  }
}

class EditSegmentFromSketchEffect extends MapEffectImpl {
  const EditSegmentFromSketchEffect({required this.patch});

  final SegmentPatchModel patch;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    final res = await context.graphEditor.updateSegment(patch);

    return res.fold((_) => null, (_) {
      if (context.mapState case SketchEdition e) {
        return e.copyWith(path: []);
      }

      return null;
    });
  }
}

class ChangeSegmentSelectedTypeEffect extends MapEffectImpl {
  const ChangeSegmentSelectedTypeEffect({required this.type});

  final MobilityType type;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    if (context.mapState.selection case MapSegment(:final id)) {
      final segment = context.graphEditor.state.segmentStore.get(id)?.current;

      if (segment == null) {
        return null;
      }

      final patch = SegmentPatchModel.fromFields(
        segment,
      ).copyWith(mobilityType: type);

      final res = await context.graphEditor.updateSegment(patch);

      return res.fold((_) => null, (_) => null);
    }
    return null;
  }
}

class CorrectSegmentFromSketchEffect extends MapEffectImpl {
  const CorrectSegmentFromSketchEffect({
    required this.segmentId,
    required this.correction,
  });

  final SegmentId segmentId;
  final List<LatLng> correction;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    final segment = context.graphEditor.state.segmentStore
        .get(segmentId)
        ?.current;

    if (segment == null) {
      return null;
    }

    final geometry = mergeCorrection(correction, segment.geometry);

    final patch = SegmentPatchModel.fromFields(
      segment,
    ).copyWith(geometry: geometry);

    final res = await context.graphEditor.correctSegment(patch, correction);

    return res.fold((_) => null, (_) {
      if (context.mapState case SketchEdition e) {
        return e.copyWith(path: []);
      }

      return null;
    });
  }
}

class DeleteSegmentEffect extends MapEffectImpl {
  const DeleteSegmentEffect({required this.segmentId});

  final SegmentId segmentId;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    final res = await context.graphEditor.deleteSegment(segmentId);

    return res.fold((_) => null, (_) => context.mapState.withSelection(null));
  }
}
