// modes/trip_editor/sketch/sketch_trace.dart
import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/mode_machine/slot.dart';
import 'package:trip_application/trip_application.dart';

/// Nommé Trace pour ne pas se confondre avec MapSketchSegment (l'objet de la carte).
final class SketchTrace {
  const SketchTrace(this.points, {this.mobilityType = MobilityType.bike});
  SketchTrace.from(WorldOffset start)
    : points = [start],
      mobilityType = MobilityType.bike;

  final List<WorldOffset> points; // jamais modifiée après construction
  final MobilityType mobilityType;

  WorldOffset? get last => points.isEmpty ? null : points.last;
  SketchTrace add(WorldOffset p) => SketchTrace([...points, p]);
}

const sketchTraceSlot = Slot<SketchTrace>('sketchTrace');
