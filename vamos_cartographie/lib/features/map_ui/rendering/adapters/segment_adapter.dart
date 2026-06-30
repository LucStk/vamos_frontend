import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/map_state_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/segment_ui_queries.dart';
import 'package:vamos_cartographie/features/topology/presentation/adapters/mobility_type_display.dart';

Polyline toPolyline(
  WidgetRef ref,
  SegmentRef segmentRef,
  Id<Trip> tripId,
  MapStateNotifier mapStateNotifier,
) {
  final segment = ref.watch(segmentUiProvider(segmentRef));
  if (segment == null) {
    throw Exception("Error to polyline");
  }
  return Polyline(
    points: segment.geometry,
    color: Color(MobilityTypeDisplay.from(segment.mobilityType).colorValue),
    strokeWidth: 5,
    hitValue: segment.id,
    pattern: segment.mobilityType.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
