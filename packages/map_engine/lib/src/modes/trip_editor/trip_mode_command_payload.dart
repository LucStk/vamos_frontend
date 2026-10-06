import 'package:trip_application/trip_application.dart';

import '../../mode_machine/mode_command.dart';
import 'map_editor_mode.dart';

abstract class EditorModeCommandPayload
    extends ModeCommandPayload<MapEditorMode> {
  const EditorModeCommandPayload();
}

/// Rien à répercuter (échec, segment introuvable, vertex créé…)
final class NoResult extends EditorModeCommandPayload {
  const NoResult();
}

final class TripSelected extends EditorModeCommandPayload {
  const TripSelected(this.trip);
  final Trip trip;
}

final class SegmentCreated extends EditorModeCommandPayload {
  const SegmentCreated(this.segment);
  final SegmentFields segment;
}

final class SegmentSpliced extends EditorModeCommandPayload {
  const SegmentSpliced(this.segment);
  final SegmentFields segment;
}

final class SegmentUpdated extends EditorModeCommandPayload {
  const SegmentUpdated(this.segmentId);
  final SegmentId segmentId;
}

final class SegmentCorrected extends EditorModeCommandPayload {
  const SegmentCorrected(this.segmentId);
  final SegmentId segmentId;
}
