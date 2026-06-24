import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_ui/domain/entities/models/segment_ui.dart';
import 'package:vamos_cartographie/features/map_editor/controllers/map_ctrl_provider.dart';

Polyline toPolyline(Segment segment, Id<Trip> tripId, MapCtrl ctrl) {
  return Polyline(
    points: segment.geometry,
    color: Color(segment.mobilityTypeUi.colorValue),
    strokeWidth: 5,
    hitValue: segment.id,
    pattern: segment.mobilityTypeUi.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
