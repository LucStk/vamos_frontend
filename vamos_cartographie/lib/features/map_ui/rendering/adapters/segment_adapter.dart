import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/map_ctrl_provider.dart';
import 'package:vamos_cartographie/core/injection/queries/segment_ui_queries.dart';
import 'package:vamos_cartographie/features/topology/segment_ui.dart';

Polyline toPolyline(
  WidgetRef ref,
  SegmentUiId segmentUiId,
  Id<Trip> tripId,
  MapCtrl ctrl,
) {
  final segment = ref.watch(segmentUiProvider(segmentUiId));
  if (segment == null) {
    throw Exception("Error to polyline");
  }
  return Polyline(
    points: segment.geometry,
    color: Color(segment.mobilityType.colorValue),
    strokeWidth: 5,
    hitValue: segment.id,
    pattern: segment.mobilityType.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
