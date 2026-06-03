import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/map/presentation/dialogs/segment_viewer_dialog.dart';
import 'package:vamos_cartographie/features/segments/segments.dart';
import "markers/segment_ghost_marker_view.dart";
import "package:vamos_cartographie/features/map/application/applications.dart";

List<Marker>? buildGhostMarker(
  WidgetRef ref,
  BuildContext context,
  int tripId,
  int segmentId,
) {
  final List<LatLng>? points = ref.watch(
    segmentTypePointsProvider(tripId, segmentId),
  );
  final SegmentType? type = ref.watch(
    segmentProvider(tripId, segmentId).select((s) => s?.type),
  );
  if (type == null || points == null) {
    return null;
  }

  return points
      .map(
        (point) => Marker(
          point: point,
          width: 20,
          height: 20,
          child: GestureDetector(child: GhostMarkerView(type: type)),
        ),
      )
      .toList();
}
