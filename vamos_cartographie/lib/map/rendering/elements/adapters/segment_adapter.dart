import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import '/topology/topology.dart';
import '/map/map.dart';

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
    color: Color(segment.mobilityTypeDisplay.colorValue),
    strokeWidth: 5,
    hitValue: segment.ref,
    pattern: segment.mobilityTypeDisplay.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
