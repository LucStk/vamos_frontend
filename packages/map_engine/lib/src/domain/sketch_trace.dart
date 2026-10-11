// modes/trip_editor/sketch/sketch_trace.dart
import 'package:latlong2/latlong.dart';

import '/src/mode_machine/slot.dart';

/// Nommé Trace pour ne pas se confondre avec MapSketchSegment (l'objet de la carte).
final class SketchTrace {
  const SketchTrace(this.points);
  SketchTrace.from(LatLng start) : points = [start];

  final List<LatLng> points; // jamais modifiée après construction

  LatLng? get last => points.isEmpty ? null : points.last;
  SketchTrace add(LatLng p) => SketchTrace([...points, p]);
}

const sketchTraceSlot = Slot<SketchTrace>('sketchTrace');
