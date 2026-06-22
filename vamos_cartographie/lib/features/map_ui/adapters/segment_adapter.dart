import 'package:flutter_map/flutter_map.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/map_editor/controllers/map_ctrl_provider.dart';

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
