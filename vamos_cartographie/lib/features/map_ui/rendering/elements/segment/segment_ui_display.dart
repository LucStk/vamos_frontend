import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/events/ui_events.dart';
import 'package:trip_domain/domain/entities/segment/segment_ui_model.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/cursor/cursor_marker.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/marker_ui_element.dart';
import 'package:vamos_cartographie/features/topology/presentation/adapters/mobility_type_display.dart';

class SegmentUiDisplay  {
  final SegmentUiModel segmentUiModel;

  const SegmentUiDisplay(super.tripId, this.segmentUiModel);

  MobilityTypeDisplay get mobilityType =>
      MobilityTypeDisplay.from(segmentUiModel.mobilityType);

  @override
  LatLng get latLng {
    // Compute center of segment geometry
    if (segmentUiModel.geometry.isEmpty) {
      return const LatLng(0, 0);
    }
    final minLat = segmentUiModel.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLat = segmentUiModel.geometry
        .map((p) => p.latitude)
        .reduce((a, b) => a > b ? a : b);
    final minLng = segmentUiModel.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLng = segmentUiModel.geometry
        .map((p) => p.longitude)
        .reduce((a, b) => a > b ? a : b);
    return LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2);
  }

  @override
  Widget buildMarker({bool isDragging = false}) =>
      CursorMarker(isDragging: isDragging);

  @override
  MapUiEvent tapEvent() => SegmentMobilityMarkerTapped(segmentUiModel.id);

  @override
  MapUiEvent doubleTapEvent() =>
      SegmentMobilityMarkerDoubleTapped(segmentUiModel.id);
}
