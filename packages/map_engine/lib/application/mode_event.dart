import 'package:map_engine/application/commands/command_result.dart';
import 'package:map_engine/domain/map_gesture.dart';
import 'package:map_engine/domain/offset_type.dart';
import 'package:trip_application/topology/topology.dart';

sealed class ModeEvent {
  const ModeEvent();
}

final class GestureEvent extends ModeEvent {
  const GestureEvent(this.gesture, this.offset);
  final MapGesture gesture;
  final ScreenOffset offset;
}

final class CommandResultEvent extends ModeEvent {
  const CommandResultEvent(this.result);
  final CommandResult result;
}

final class IntentEvent extends ModeEvent {
  const IntentEvent(this.intent);
  final ModeIntent intent;
}

/// Intentions de l'UI : un type par famille de modes.
abstract interface class ModeIntent {}

sealed class EditorIntent implements ModeIntent {
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
