import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/segment_ui_element.dart';

Polyline toPolyline(SegmentUiElement element, Id<Trip> tripId, MapCtrl ctrl) {
  return Polyline(
    points: element.segment.geometry,
    color: element.segment.mobilityType.color,
    strokeWidth: 5,
    hitValue: element.segment.id,
    pattern: element.segment.mobilityType.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
