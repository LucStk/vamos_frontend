import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/infrastructure/controllers/map_ctrl_provider.dart';

Polyline toPolyline(Segment segment, Id<Trip> tripId, MapCtrl ctrl) {
  return Polyline(
    points: segment.geometry,
    color: segment.mobilityType.color,
    strokeWidth: 5,
    hitValue: segment.id,
    pattern: segment.mobilityType.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
