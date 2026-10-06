import 'package:latlong2/latlong.dart';
import 'package:map_engine/application/trip_editor_mode/map_editor_mode.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

sealed class EditorModeCommand extends ModeCommand<MapEditorMode> {
  const EditorModeCommand();
}

final class CreateSimpleVertex extends EditorModeCommand {
  const CreateSimpleVertex(this.position);
  final LatLng position;
}

final class MoveVertex extends EditorModeCommand {
  const MoveVertex(this.vertexId, this.position);
  final VertexId vertexId;
  final LatLng position;
}

final class RemoveVertex extends EditorModeCommand {
  const RemoveVertex(this.vertexId);
  final VertexId vertexId;
}

final class CreateWaypointFromVertex extends EditorModeCommand {
  const CreateWaypointFromVertex(this.vertexId);
  final VertexId vertexId;
}

final class CreateWaypointFromPosition extends EditorModeCommand {
  const CreateWaypointFromPosition(this.position);
  final LatLng position;
}

final class CreateSegmentFromSketch extends EditorModeCommand {
  const CreateSegmentFromSketch({
    required this.startVertexId,
    required this.geometry,
    required this.mobilityType,
    this.endVertexId,
  });

  final VertexId startVertexId;
  final VertexId? endVertexId;
  final List<LatLng> geometry;
  final MobilityType mobilityType;
}

final class SpliceSegment extends EditorModeCommand {
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

final class EditSegmentFromSketch extends EditorModeCommand {
  const EditSegmentFromSketch(this.patch);
  final SegmentPatchModel patch;
}

final class CorrectSegmentFromSketch extends EditorModeCommand {
  const CorrectSegmentFromSketch({
    required this.segmentId,
    required this.correction,
  });

  final SegmentId segmentId;
  final List<LatLng> correction;
}

final class ChangeSelectedSegmentType extends EditorModeCommand {
  const ChangeSelectedSegmentType(this.segmentId, this.mobilityType);
  final SegmentId segmentId;
  final MobilityType mobilityType;
}

final class DeleteSegment extends EditorModeCommand {
  const DeleteSegment(this.segmentId);
  final SegmentId segmentId;
}

final class CutSketchSegment extends EditorModeCommand {
  // Coupe le segment à l'endroit du pointeur down
  const CutSketchSegment(this.screenOffset);
  final ScreenOffset screenOffset;
}

final class AddPointToSketchSegment extends EditorModeCommand {
  const AddPointToSketchSegment(this.screenOffset);
  final ScreenOffset screenOffset;
}
