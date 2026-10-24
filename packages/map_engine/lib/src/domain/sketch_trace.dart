// modes/trip_editor/sketch/sketch_trace.dart
import 'package:domain_core/space/offset_type.dart';
import 'package:trip_application/trip_application.dart';
import 'dart:ui';

final class SketchTrace {
  const SketchTrace(
    this.points, {
    this.mobilityType = MobilityType.bike,
    this.grabOffset = Offset.zero,
  });
  SketchTrace.from(WorldOffset start)
    : points = [start],
      mobilityType = MobilityType.bike,
      grabOffset = Offset.zero;

  final List<WorldOffset> points;
  final MobilityType mobilityType;

  /// Écart (monde) entre le pointeur et la pointe du crayon au moment de la saisie.
  final Offset grabOffset;

  WorldOffset? get last => points.isEmpty ? null : points.last;

  /// Mémorise où le crayon a été saisi, par rapport à sa pointe.
  SketchTrace grabbedAt(WorldOffset pointer) => SketchTrace(
    points,
    mobilityType: mobilityType,
    grabOffset: last == null ? Offset.zero : pointer.value - last!.value,
  );

  /// [pointer] est la position du pointeur ; la pointe est placée à
  /// `pointer - grabOffset`.
  SketchTrace add(WorldOffset pointer) => SketchTrace(
    [...points, WorldOffset(pointer.value - grabOffset)],
    mobilityType: mobilityType,
    grabOffset: grabOffset,
  );
}
