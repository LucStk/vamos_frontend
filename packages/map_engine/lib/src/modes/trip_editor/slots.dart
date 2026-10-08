// modes/trip_editor/slots.dart
import '../../domain/selection.dart';
import '../../mode_machine/slot.dart';
import 'map_editor_mode.dart';

const selection = Slot<Selection>(
  'selection',
  clearWhen: leavesType<IdleEditor>, // ou null pour survivre au sketch
);
