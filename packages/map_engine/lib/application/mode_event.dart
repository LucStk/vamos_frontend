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



/// Intentions de l'UI : un type par famille de modes.
abstract interface class ModeIntent {}
