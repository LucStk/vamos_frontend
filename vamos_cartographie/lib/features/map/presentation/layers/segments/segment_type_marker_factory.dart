import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import "markers/segment_type_marker_view.dart";
import "package:vamos_cartographie/features/map/application/applications.dart";
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart';

List<Marker>? buildTypeMarker(
  WidgetRef ref,
  BuildContext context,
  int tripId,
  int segmentId,
) {
  final List<LatLng>? points = ref.watch(
    segmentTypePointsProvider(tripId, segmentId),
  );
  final GSegmentTypeEnum? type = ref.watch(
    segmentProvider(tripId, segmentId).select((s) => s?.type),
  );
  debugPrint("type_marker_factory $type points $points");
  if (type == null || points == null) {
    return null;
  }

  return points
      .map(
        (point) => Marker(
          point: point,
          width: 20,
          height: 20,
          child: GestureDetector(
            onTap: () {},
            child: SegmentTypeMarkerView(type: type),
          ),
        ),
      )
      .toList();
}
