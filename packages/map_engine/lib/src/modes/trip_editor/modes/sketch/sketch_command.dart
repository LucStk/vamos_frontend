part of "/src/modes/trip_editor/map_editor_command.dart";

sealed class SketchCommand<R extends Object> extends EditorCommand<R> {
  const SketchCommand();
}

final class CreateSegmentFromSketch extends SketchCommand<SegmentRemoteModel> {
  const CreateSegmentFromSketch({
    required this.geometry,
    required this.mobilityType,
  });
  final List<LatLng> geometry;
  final MobilityType mobilityType;
}

final class SpliceSegment extends SketchCommand<SegmentId> {
  const SpliceSegment({
    required this.segmentId,
    required this.correction,
    required this.startAnchor,
    required this.endAnchor,
  });
  final SegmentId segmentId;
  final List<LatLng> correction;
  final SpliceAnchor startAnchor;
  final SpliceAnchor endAnchor;
}

final class EditSegmentFromSketch extends SketchCommand<Done> {
  const EditSegmentFromSketch(this.patch);
  final SegmentPatchModel patch;
}

final class CorrectSegmentFromSketch extends SketchCommand<Done> {
  const CorrectSegmentFromSketch({
    required this.segmentId,
    required this.correction,
  });
  final SegmentId segmentId;
  final List<LatLng> correction;
}

/// Projette un point écran en coordonnée géo ; le mode ajoute le résultat à son tracé.
final class AddPointToSketchSegment extends SketchCommand<LatLng> {
  const AddPointToSketchSegment(this.screenOffset);
  final ScreenOffset screenOffset;
}
