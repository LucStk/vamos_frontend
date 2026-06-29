import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/events/ui_events.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/cursor/cursor_marker.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/marker_ui_element.dart';
import 'package:vamos_cartographie/features/topology/segment_ui.dart';

class SegmentUiElement extends MarkerUiElement {
  final SegmentUi segmentUi;

  const SegmentUiElement(super.tripId, this.segmentUi);

  @override
  LatLng get latLng {
    // Compute center of segment geometry
    if (segmentUi.geometry.isEmpty) {
      return const LatLng(0, 0);
    }
    final minLat = segmentUi.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLat = segmentUi.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a > b ? a : b);
    final minLng = segmentUi.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLng = segmentUi.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a > b ? a : b);
    return LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2);
  }

  @override
  Widget buildMarker({bool isDragging = false}) =>
      CursorMarker(isDragging: isDragging);

  @override
  MapUiEvent tapEvent() => SegmentMobilityMarkerTapped(segmentUi.id);

  @override
  MapUiEvent doubleTapEvent() =>
      SegmentMobilityMarkerDoubleTapped(segmentUi.id);
}
