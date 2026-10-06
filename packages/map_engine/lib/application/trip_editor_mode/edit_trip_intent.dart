import 'package:map_engine/application/application.dart';
import 'package:trip_application/topology/topology.dart';

sealed class EditorIntent implements IntentEvent<MapEditorMode> {
  const EditorIntent();
}

final class StartSketch extends EditorIntent {
  const StartSketch();
}

final class StartSegmentEdit extends EditorIntent {
  const StartSegmentEdit();
}

final class StopSketch extends EditorIntent {
  const StopSketch();
}

final class DeleteSelected extends EditorIntent {
  const DeleteSelected();
}

final class ChangeSegmentType extends EditorIntent {
  const ChangeSegmentType(this.type);
  final MobilityType type;
}
