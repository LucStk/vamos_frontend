import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart';
import "package:vamos_cartographie/features/segments/segments.dart";

Polyline? buildLine(
  WidgetRef ref,
  BuildContext context,
  int tripId,
  int segmentId,
) {
  final type = ref.watch(
    segmentProvider(tripId, segmentId).select((s) => s?.type),
  );

  final points = ref.watch(segmentPointsProvider(tripId, segmentId));

  if (points == null || points.isEmpty || type == null) {
    debugPrint("Segment $segmentId ignoré : points vides");
    return null;
  }

  return Polyline(
    points: points,
    color: type.color,
    strokeWidth: 5,
    pattern: type.isDashed
        ? StrokePattern.dashed(segments: const [12, 8])
        : const StrokePattern.solid(),
  );
}
